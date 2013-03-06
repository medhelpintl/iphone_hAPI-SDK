//
//  MHError.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/8/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kMHErrorDomain @"MedHelp"

enum MHRequestError {
    kNetworkNotAvailable = 1,
    kServerError,
    kServerNotAvailable,
    kInvalidToken,
    kNoToken, // not logged in
    kDataError
};

@interface MHError : NSError

+ (MHError*) networkNotAvailableError;
+ (MHError*) serverNotAvailableError;
+ (MHError*) serverNotAvailableErrorWithUserInfo:(NSDictionary*) userInfo;
+ (MHError*) serverError;
+ (MHError*) serverErrorWithUserInfo:(NSDictionary*) userInfo;
+ (MHError*) invalidTokenError;
+ (MHError*) noTokenError;

+ (MHError*) errorWithCode:(int)code userInfo:(NSDictionary*)userInfo;

+ (NSString*) medHelpErrorDomain;

@end
