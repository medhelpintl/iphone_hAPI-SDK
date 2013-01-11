//
//  MedHelp.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MedHelp.h"

@implementation MedHelp

static NSString* clientID_ = NULL;

+ (void) startWithClientID:(NSString *)clientID andSecret:(NSString *)secret
{
    clientID_ = clientID;
}

+ (NSString*) clientID
{
    return clientID_;
}

@end
