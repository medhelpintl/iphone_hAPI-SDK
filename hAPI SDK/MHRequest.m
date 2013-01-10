//
//  MHRequest.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHRequest.h"

#import "MedHelp.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"

@interface MHRequest ()
@property (nonatomic, strong) AFJSONRequestOperation *request;
@property (nonatomic, strong) NSString *httpMethod;

@end


@implementation MHRequest

#pragma mark -
#pragma mark PROPERTIES

- (NSString*) httpMethod
{
    switch (self.method) {
        case kPOST:
            return @"POST";
        case kPUT:
            return @"PUT";
        case kGET:
            return @"GET";
        case kDELETE:
            return @"DELETE";
        default:
            return @"POST";
    }
}

#pragma mark -
#pragma mark INIT

- (id) initWithEndPoint:(NSString *)endPoint
{
    if (self = [super init]) {
        self.endPoint = endPoint;
    }
    return self;
}

#pragma mark -
#pragma mark NETWORK

- (id) start:(NSError *__autoreleasing *)error
{
// Check Network Availability
#ifdef _SYSTEMCONFIGURATION_H
    if ([[MHHTTPClient sharedInstance] networkReachabilityStatus]) {
        DLog(@"Network Not Available");
        *error = [MHError networkNotAvailableError];
        return nil;
    }
#endif
// Check Logged In
    if (![[MHLoginClient sharedLoginClient] accessToken]) {
        DLog(@"Not Logged In");
        *error = [MHError noTokenError];
        return nil;
    }
    
// Perform Network Request
    // Client ID
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:self.params];
    [params setObject:[MedHelp appID] forKey:@"client_id"];
    
    DLog(@"EndPoint: %@", self.endPoint);
    DLog(@"Method: %@", self.httpMethod);
    DLog(@"Body: %@", self.body);
    DLog(@"Params: %@", params);
    
    __block id json = nil;
    __block NSError *error_success = nil;
    __block NSError *error_fail = nil;
    
    // Single Threaded Semaphore
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    // Method, Endpoint, Params
    NSMutableURLRequest *urlRequest = [[MHHTTPClient sharedInstance] requestWithMethod:self.httpMethod path:self.endPoint parameters:params];
    [urlRequest setHTTPBody:[self.body dataUsingEncoding:NSUTF8StringEncoding]];
    
    DLog(@"URL: %@", urlRequest.URL.absoluteString);
    
    AFJSONRequestOperation *httpRequest = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        int status_code = [[JSON valueForKeyPath:@"status_code"] intValue];
        NSString *data = [JSON valueForKeyPath:@"data"];
        
        // Switch on status_code
        switch (status_code) {
            case 0:
                json = data;
                break;
            default:
                // Error
                error_success = [MHError errorWithDomain:@"MedHelp" code:status_code userInfo:[NSDictionary dictionaryWithObject:data forKey:@"data"]];
                break;
        }
        
        dispatch_semaphore_signal(sema);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error_, id JSON) {
        error_fail = error_;
        
        dispatch_semaphore_signal(sema);
    }];

    [[MHHTTPClient sharedInstance] enqueueHTTPRequestOperation:httpRequest];

    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    // Set Error
    if (error_fail) { // Networking Error
        *error = [MHError serverNotAvailableErrorWithUserInfo:error_fail.userInfo];
    } else { // hAPI Error
        *error = error_success;
    }
    
    return json;
}

@end
