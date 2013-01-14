//
//  MedHelp.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MedHelp.h"

#import "MHSessionManager.h"
#import "MHOAuthManager.h"

@interface MedHelp ()
+ (NSString*) clientID;
+ (NSString*) clientSecret;
@end

@implementation MedHelp

static NSString* clientID_ = NULL;
static NSString* clientSecret_ = NULL;

+ (void) startWithClientID:(NSString*)clientID clientSecret:(NSString*)clientSecret;
{
    clientID_ = clientID;
    clientSecret_ = clientSecret;
    
    // Setup for OAUTH
    [[MHSessionManager sharedManager] setLoginManager:[MHOAuthManager sharedAuthManager]];
}

+ (NSString*)clientID
{
    return clientID_;
}


+ (NSString*)clientSecret
{
    return clientSecret_;
}

#pragma mark -
#pragma mark LOGIN HELPER

+ (void) login:(MHErrorBlock)completionBlock
{
    // Verify we're using OAUTH
    if (![[[MHSessionManager sharedManager] loginManager] isKindOfClass:[MHOAuthManager class]]) {
        @throw @"OAuth is not set up correctly";
    }
    
    [[MHOAuthManager sharedAuthManager] login:completionBlock];
}


@end
