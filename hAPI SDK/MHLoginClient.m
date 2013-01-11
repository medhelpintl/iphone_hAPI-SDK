//
//  MHLoginClient.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHLoginClient.h"
#import "MHOAuthManager.h"
@implementation MHLoginClient

#pragma mark -
#pragma mark PROPERTIES

- (NSString*) userID
{
#warning FISHSTIX
//    return @"2024679";
#warning SOMEONE ELSE
    return @"641606";
}

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
    [[MHOAuthManager sharedAuthManager] login];
    completionBlock(nil);
}

- (void) logout:(MHErrorBlock)completionBlock
{
    self.accessToken = nil;
    
    completionBlock(nil);
}

#pragma mark -
#pragma mark HELPER

- (BOOL) isLoggedIn
{
    return self.accessToken != nil;
}

@end
