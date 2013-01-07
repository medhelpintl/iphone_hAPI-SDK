//
//  MHRequest.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

enum MHRequestError {
    kNetworkNotAvailable = 1,
    kServerNotAvailable,
    kInvalidToken,
    kNoToken
};

@interface MHRequest : NSObject

@end
