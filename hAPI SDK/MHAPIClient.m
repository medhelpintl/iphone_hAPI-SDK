//
//  MHAPIManager.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHAPIClient.h"

#define MHAPIBaseURLString @"http://hapi-1710-test.apigee.net/v1/"


@implementation MHAPIClient
@synthesize accessToken = _accessToken;

+ (id)sharedInstance {
    static MHAPIClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[MHAPIClient alloc] initWithBaseURL:[NSURL URLWithString:MHAPIBaseURLString]];
    });
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setDefaultHeader:@"Bearer" value:self.accessToken];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}


@end
