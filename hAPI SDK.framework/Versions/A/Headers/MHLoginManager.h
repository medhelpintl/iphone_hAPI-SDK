//
//  MHLoginClient.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GlobalConstants.h"

@interface MHLoginManager : NSObject

@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSString *accessToken;

+ (MHLoginManager*) sharedLoginClient;

- (void) anonCreate:(MHErrorBlock)completionBlock;

- (void) login:(MHErrorBlock)completionBlock;
#warning PRIVATE TO MEDHELP
- (void) login:(NSString*)userName :(NSString*)password :(MHErrorBlock)completionBlock;

- (void) logout:(MHErrorBlock)completionBlock;



- (BOOL) isLoggedIn;


@end