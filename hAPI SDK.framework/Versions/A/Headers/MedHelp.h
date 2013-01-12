//
//  MedHelp.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GlobalConstants.h"

#import "MHLoginClient.h"

#import "MHObject.h"
#import "MHHealthData.h"
#import "MHQuery.h"
#import "MHBatch.h"

#import "MHError.h"

@interface MedHelp : NSObject
+ (void) startWithClientID:(NSString*) clientID andSecret:(NSString*)secret;
+ (NSString*) clientID;
+ (NSString*) secret;
@end
