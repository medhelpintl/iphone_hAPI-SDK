//
//  MHOAuthManager.h
//  MHRunTracker
//
//  Created by Winfred Raguini on 11/7/12.
//  Copyright (c) 2012 Winfred Raguini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHOAuthManager : NSObject
@property (nonatomic, strong) NSString *accessToken;

+ (MHOAuthManager *)sharedAuthManager;

// Take in a completion block
- (void)login:(NSString*)clientID :(NSString*)appURLScheme;

@end
