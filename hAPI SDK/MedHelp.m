//
//  MedHelp.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/4/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MedHelp.h"

@interface MedHelp ()
+ (NSString*) clientID;
+ (NSString*) clientSecret;
@end

@implementation MedHelp

static NSString* clientID_ = NULL;
static NSString* clientSecret_ = NULL;

+ (void) startWithClientID:(NSString*)clientID clientSecret:(NSString*)clientSecret;
{
    clientID_ = clientID;
    clientSecret_ = clientSecret;
}

+ (NSString*)clientID
{
    return clientID_;
}


+ (NSString*)clientSecret
{
    return clientSecret_;
}
@end
