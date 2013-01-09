//
//  GlobalConstants.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#ifndef hAPI_SDK_GlobalConstants_h
#define hAPI_SDK_GlobalConstants_h

#define HAPI_API_KEY @"testkey123456789"

@class MHHealthData;

typedef void (^MHBooleanResultBlock)(BOOL succeeded, NSError *error);
typedef void (^MHHealthDataResultBlock)(MHHealthData *user_data, NSError *error);
typedef void (^MHArrayResultBlock)(NSArray *user_data, NSError *error);

typedef void (^MHErrorBlock)(NSError *error);

#endif


//#define _AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES_ 1