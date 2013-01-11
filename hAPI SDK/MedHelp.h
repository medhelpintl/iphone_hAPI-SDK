//
//  MedHelp.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GlobalConstants.h"
#import "NSDate+hAPI.h"

@interface MedHelp : NSObject
+ (void) startWithClientID:(NSString*)clientID clientSecret:(NSString*)clientSecret;
@end
