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

+ (MHError*) serverNotAvailableError
{
    return [MHError errorWithDomain:kMHErrorDomain code:kServerNotAvailable userInfo:nil];
}

+ (MHError*) invalidTokenError
{
    return [MHError errorWithDomain:kMHErrorDomain code:kInvalidToken userInfo:nil];
}

+ (MHError*) noTokenError
{
    return [MHError errorWithDomain:kMHErrorDomain code:kNoToken userInfo:nil];
}

@end