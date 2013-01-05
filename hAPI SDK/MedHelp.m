//
//  MedHelp.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MedHelp.h"

@implementation MedHelp

static NSString* appID = NULL;

+ (void) startWithAppID:(NSString *)appID_
{
    appID = appID_;
}

+ (NSString*) appID
{
    return appID;
}

@end
