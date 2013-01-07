//
//  MHLoginClient.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHLoginClient.h"

@implementation MHLoginClient

#pragma mark -
#pragma mark SINGLETON

+ (MHLoginClient*) sharedLoginClient {
    static MHLoginClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[MHLoginClient alloc] init];
    });
    return __sharedInstance;
}

#pragma mark -
#pragma mark AUTH

- (void) anonCreate:(MHErrorBlock)completionBlock
{
    completionBlock(nil);
}

- (void) login:(MHErrorBlock)completionBlock
{
    completionBlock(nil);
}

- (void) logout:(MHErrorBlock)completionBlock
{
    self.accessToken = nil;
    
    completionBlock(nil);
}

@end
