//
//  MHObjectCollection.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/10/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHBatch.h"

#import "MHObject.h"
#import "MHAPIClient.h"

@implementation MHBatch

+ (void) saveAll:(NSArray *)user_data
{
    NSMutableArray *create_data = [NSMutableArray array];
    NSMutableArray *update_data = [NSMutableArray array];
    
    for (MHObject *obj in user_data) {
        if (obj.uniqueId) {
            [update_data addObject:obj];
        } else {
            [create_data addObject:obj];
        }
    }
    
    [[MHAPIClient sharedAPIClient] update:update_data :nil];
    [[MHAPIClient sharedAPIClient] create:create_data :nil];
}

@end
