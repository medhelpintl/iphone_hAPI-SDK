//
//  MHError.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/8/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHError.h"

#define kMHErrorDomain @"MedHelp"

@implementation MHError

+ (MHError*) networkNotAvailableError
{
    return [MHError errorWithDomain:kMHErrorDomain code:kNetworkNotAvailable userInfo:nil];
}

+ (MHError*) serverError
{
    return [MHError serverErrorWithUserInfo:nil];
}

+ (MHError*) serverErrorWithUserInfo:(NSDictionary *)userInfo
{
    return [MHError errorWithDomain:kMHErrorDomain code:kServerError userInfo:userInfo];
}

+ (MHError*) serverNotAvailableError
{
    return [MHError serverNotAvailableErrorWithUserInfo:nil];
}

+ (MHError*) serverNotAvailableErrorWithUserInfo:(NSDictionary *)userInfo
{
    return [MHError errorWithDomain:kMHErrorDomain code:kServerNotAvailable userInfo:userInfo];
}

+ (MHError*) invalidTokenError
{
    return [MHError errorWithDomain:kMHErrorDomain code:kInvalidToken userInfo:nil];
}

+ (MHError*) noTokenError
{
    return [MHError errorWithDomain:kMHErrorDomain code:kNoToken userInfo:nil];
}

+ (MHError*) errorWithCode:(int)code userInfo:(NSDictionary *)userInfo
{
    return [MHError errorWithDomain:kMHErrorDomain code:code userInfo:userInfo];
}

@end
