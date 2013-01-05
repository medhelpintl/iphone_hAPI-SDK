//
//  MedHelp.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedHelp : NSObject
+ (void) startWithAppID:(NSString*) appID;
+ (NSString*) appID;
@end
