//
//  MedHelp.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MedHelp.h"

@implementation MedHelp

static NSString* appID_ = NULL;

+ (void) startWithAppID:(NSString *)appID
{
    appID_ = appID;
}

+ (NSString*) appID
{
    return appID_;
}

@end
