//
//  MHOAuthManager.h
//  MHRunTracker
//
//  Created by Winfred Raguini on 11/7/12.
//  Copyright (c) 2012 Winfred Raguini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHOAuthManager : NSObject
+ (MHOAuthManager *)sharedAuthManager;
- (void)setAuthCodeFromRequest:(NSURLRequest*)urlRequest;

@property (nonatomic, strong) NSString *authCode;
@property (nonatomic, strong) NSString *accessToken;
@end
