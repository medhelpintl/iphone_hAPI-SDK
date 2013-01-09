//
//  MHHTTPClient.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHHTTPClient.h"

#import "MedHelp.h"
#import "MHOAuthManager.h"

//#define MHAPIBaseURLString @"https://hapi-1710-test.apigee.net/v1/"
#define MHAPIBaseURLString @"http://hapi.partner2.medhelp.ws"

@interface MHHTTPClient()
@property (nonatomic, strong) NSString *accessToken;
@end

@implementation MHHTTPClient

#pragma mark -
#pragma mark PROPERTIES

- (NSString*) accessToken
{
    return [[MHOAuthManager sharedAuthManager] accessToken];
}

- (void) setAccessToken:(NSString *)accessToken
{
    // Not Yet
}

#pragma mark -
#pragma mark INIT

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setParameterEncoding:AFJSONParameterEncoding];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        // Monitor Access Token on Auth Manager
        [[MHOAuthManager sharedAuthManager] addObserver:self forKeyPath:@"accessToken" options:NSKeyValueChangeReplacement context:NULL];
        
        [self.operationQueue setMaxConcurrentOperationCount:1];
        
        [self setDefaultHeader:@"appID" value:[MedHelp appID]];
        [self setDefaultHeader:@"Content-Type" value:@"text/json"];
        
#ifdef _SYSTEMCONFIGURATION_H
        [self startMonitoringNetworkReachability];
#endif
    }
    
    return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"accessToken"]) {
        [self setDefaultHeader:@"Bearer" value:self.accessToken];
    }
}

#pragma mark -
#pragma mark SINGLETON

+ (id)sharedInstance {
    static MHHTTPClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[MHHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:MHAPIBaseURLString]];
    });
    return __sharedInstance;
}


@end