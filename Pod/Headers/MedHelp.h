//
//  MedHelp.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GlobalConstants.h"

#import "MHObject.h"
#import "MHHealthData.h"
#import "MHQuery.h"
#import "MHBatch.h"

#import "MHError.h"

@protocol MedHelpLogger

@required
- (void)logInfo:(NSString*)info;

@end


@interface MedHelp : NSObject
+ (void) startWithClientID:(NSString*)clientID clientSecret:(NSString*)clientSecret;
+ (void) startWithClientID:(NSString*)clientID;
+ (NSString*) clientID;
+ (NSString*) clientSecret;

+ (NSString*) baseURL;
+ (void) setBaseURL:(NSString*)baseURL;

// OAuth Login Helper?
+ (void) login:(MHErrorBlock)completionBlock;
+ (void)loadCallBackURL:(NSURL*)callbackURL;
+ (void) logout:(MHErrorBlock)completionBlock;
+ (BOOL) isLoggedIn;

// Debug
+ (void)setDebug:(BOOL)debugMode;
+ (BOOL)isDebugMode;

// Breadcrumbs/Logging
+ (void)setLogger:(id<MedHelpLogger>)logger;
+ (void)logInfo:(NSString*)info;

@end
