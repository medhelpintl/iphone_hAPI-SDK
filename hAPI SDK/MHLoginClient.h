//
//  MHLoginClient.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHLoginClient : NSObject

@property (nonatomic, strong) NSString* accessToken;

+ (MHLoginClient*) sharedLoginClient;

- (void) anonCreate:(MHErrorBlock)completionBlock;
- (void) login:(MHErrorBlock)completionBlock;
- (void) logout:(MHErrorBlock)completionBlock;

@end
