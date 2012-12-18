//
//  MHOAuthManager.m
//  MHRunTracker
//
//  Created by Winfred Raguini on 11/7/12.
//  Copyright (c) 2012 Winfred Raguini. All rights reserved.
//

#import "MHOAuthManager.h"

@interface MHOAuthManager ()
@property (nonatomic, strong) NSString *authCode;
- (void)requestAccessToken;
- (void)setAuthCodeFromRequest:(NSURLRequest*)urlRequest;
@end

@implementation MHOAuthManager
@synthesize authCode = authCode_;
@synthesize accessToken = accessToken_;

#pragma mark -
#pragma mark INIT

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark -
#pragma mark SINGLETON

static MHOAuthManager *sharedManager = nil;

+ (MHOAuthManager *)sharedAuthManager
{
    @synchronized([MHOAuthManager class]) {
        if (!sharedManager) {
            sharedManager = [[MHOAuthManager alloc] init];
        }
    }
    
    return sharedManager; 
}

- (void) login:(NSString *)clientID :(NSString *)appURLScheme
{
    //
}

- (void)setAuthCodeFromRequest:(NSURLRequest*)urlRequest
{
    NSString *urlString = [[urlRequest URL] absoluteString];
    NSLog(@"the request is %@", urlString);
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"code=([a-z0-9]+)" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:urlString
                                                    options:0
                                                      range:NSMakeRange(0, [urlString length])];
    if (match) {
        NSRange firstHalfRange = [match rangeAtIndex:1];
        NSLog(@"range %d", firstHalfRange.location);
        NSString *code = [urlString substringWithRange:firstHalfRange];
        NSLog(@"code: %@", code);
        self.authCode = code;
        //Now get the access token asynchronously
        [self requestAccessToken];
    } else{
        NSException *exception = [NSException exceptionWithName: @"OAuthException"
                                                         reason: @"Auth code missing."
                                                       userInfo: nil];
        @throw exception;
    }
    
}

- (void)requestAccessToken
{
    
}

@end
