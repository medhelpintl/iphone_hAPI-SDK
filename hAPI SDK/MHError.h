//
//  MHError.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/8/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

enum MHRequestError {
    kNetworkNotAvailable = 1,
    kServerNotAvailable,
    kInvalidToken,
    kNoToken // not logged in
};

@interface MHError : NSError

+ (MHError*) networkNotAvailableError;
+ (MHError*) serverNotAvailableError;
+ (MHError*) serverNotAvailableErrorWithUserInfo:(NSDictionary*) userInfo;
+ (MHError*) invalidTokenError;
+ (MHError*) noTokenError;

+ (MHError*) errorWithCode:(int)code userInfo:(NSDictionary*)userInfo;

@end
