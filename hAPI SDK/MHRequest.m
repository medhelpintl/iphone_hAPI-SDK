//
//  MHRequest.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHRequest.h"

#import "MHHTTPClient.h"
#import "MHLoginClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"
#import "MHError.h"

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
    DLog(@"EndPoint: %@", self.endPoint);
    DLog(@"Method: %@", self.httpMethod);
    DLog(@"Body: %@", self.body);
    DLog(@"Params: %@", self.params);
    
    __block id json = nil;
    __block NSError *error_ = nil;
    
    // Single Threaded Semaphore
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    // Method, Endpoint, Params
    NSURLRequest *urlRequest = [[MHHTTPClient sharedInstance] requestWithMethod:self.httpMethod path:self.endPoint parameters:self.params];

    DLog(@"URL: %@", urlRequest.URL.absoluteString);
    
    AFHTTPRequestOperation *httpRequest = [[MHHTTPClient sharedInstance] HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id response) {
        json = response;
        
        DLog(@"SUCCESS: %@", response);
        dispatch_semaphore_signal(sema);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error__) {
        error_ = error__;
        
        DLog(@"FAILURE: %@", error__);
        dispatch_semaphore_signal(sema);
    }];
    DLog(@"Class: %@", NSStringFromClass([httpRequest class]));
    [[MHHTTPClient sharedInstance] enqueueHTTPRequestOperation:httpRequest];
    [httpRequest start];

    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    // Set Error
    if (error_) { // Networking Error
        *error = [MHError serverNotAvailableError];
    }
    
    return json;
}

@end
