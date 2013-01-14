//
//  MHOAuthManager.m
//  MHRunTracker
//
//  Created by Winfred Raguini on 11/7/12.
//  Copyright (c) 2012 Winfred Raguini. All rights reserved.
//

#import "MHOAuthManager.h"
#import "MHUtil.h"
#import "AFNetworking.h"

@interface MHOAuthManager ()
@property (nonatomic, strong) NSString *authCode;
- (void)requestAccessToken;
@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *urlScheme;
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *clientSecret;
- (void)setAuthCodeFromRequest:(NSURLRequest*)urlRequest;
- (BOOL)checkAuthCodeWithURL:(NSURL*)callbackURL;
- (BOOL)validAccessToken;
@end

@implementation MHOAuthManager
@synthesize authCode = authCode_;
@synthesize accessToken = accessToken_;
@synthesize refreshToken = refreshToken_;
@synthesize clientID = clientID_;
@synthesize clientSecret = clientSecret_;
#pragma mark -
#pragma mark INIT

- (id)init
{
    if (self = [super init]) {
        self.urlScheme = [MHUtil urlScheme];
        if (!self.urlScheme) {
            NSException *exception = [NSException exceptionWithName: @"OAuthException"
                                                             reason: @"URL scheme missing."
                                                           userInfo: nil];
            @throw exception;
        } else {
            
        }
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

#pragma mark -
#pragma mark LOGIN MANAGEMENT

- (BOOL) isLoggedIn
{
    return self.accessToken != nil;
}

#pragma mark -
#pragma mark OAUTH

- (void) login
{
    self.clientID = @"hd42sRGKw5f5bAYEWAiiyyKTfwIh8X77";
    self.clientSecret = @"Dvi6xFlbUlziGgk1";
    NSLog(@"self.accesstoken %@", self.accessToken);
    if ([self validAccessToken]) {
        if (self.refreshToken) {
            //Just need to ask for access token through refresh token and bypass OAuth dance
        } else {
            //Start OAuth dance
            NSString* authUrlString = [NSString stringWithFormat:@"https://partner2.medhelp.ws/oauth/authorize?authorize=Yes&response_type=code&redirect_uri=%@&client_id=%@",self.urlScheme,self.clientID];
            NSLog(@"url: %@", authUrlString);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: authUrlString]];
        }
    }
}

- (BOOL)validAccessToken
{
    return !self.accessToken;
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
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://partner2.medhelp.ws/oauth/token"]];
    [request setHTTPMethod:@"POST"];
    NSString *postString = [NSString stringWithFormat:@"authorize=Yes&response_type=code&redirect_uri=%@&client_id=%@&client_secret=%@&grant_type=authorization-code&code=%@",self.urlScheme,self.clientID,self.clientSecret,self.authCode];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
        DLog(@"JSON SUCCESS");
        DLog(@"JSON: %@", JSON);
        
        if ([JSON valueForKey:@"access_token"]) {
            self.refreshToken = [JSON valueForKeyPath:@"refresh_token"];
            self.accessToken = [JSON valueForKeyPath:@"access_token"];
            DLog(@"refreshToken: %@", self.refreshToken);
            DLog(@"accessToken: %@", self.accessToken);
        }
    } failure:nil];
    [operation start];
}

- (void)loadCallBackURL:(NSURL *)callbackURL
{
    if ([self checkAuthCodeWithURL:callbackURL]) {
        //Get access token
        [self requestAccessToken];
    }
}

- (BOOL)checkAuthCodeWithURL:(NSURL*)callbackURL
{
    NSString *callbackURLString = [callbackURL absoluteString];
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"code=(\\w+)&expires_in"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:callbackURLString options:0 range:NSMakeRange(0, [callbackURLString length])];
    if (match) {
        self.authCode = [callbackURLString substringWithRange:[match rangeAtIndex:1]];
        return YES;
    }
    return NO;
    
}

@end
