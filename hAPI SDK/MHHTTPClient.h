//
//  MHHTTPClient.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface MHHTTPClient : AFHTTPClient
+ (id)sharedInstance;
@end
