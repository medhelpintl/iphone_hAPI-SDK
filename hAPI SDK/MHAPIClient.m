//
//  MHAPIClient.m
//  hAPI SDK
//
//  Created by Charles Fisher on 12/17/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHAPIClient.h"

@implementation MHAPIClient

#pragma mark -
#pragma mark SINGLETON

+ (id)sharedInstance {
    static MHAPIClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[MHAPIClient alloc] init];
    });
    return __sharedInstance;
}


#pragma mark -
#pragma mark API

- (void) create:(NSArray*) user_data
{
    DLog(@"Create: %@", user_data);
}

- (void) update:(NSArray*) user_data
{
    DLog(@"Update: %@", user_data);
}

- (NSArray*) read:(NSDate*)startDate :(NSDate*)endDate
{
    DLog(@"READ");
    return [NSArray array];
}

// delete
- (void) destroy:(NSArray *)user_data
{
    DLog(@"Destroy: %@", user_data);
}


@end
