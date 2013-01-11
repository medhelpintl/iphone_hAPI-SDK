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

#pragma mark -
#pragma mark SAVE

+ (void) saveAll:(NSArray *)user_data error:(NSError *__autoreleasing *)error
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
    
    [[MHAPIClient sharedAPIClient] update:update_data :error];
    [[MHAPIClient sharedAPIClient] create:create_data :error];
}

+ (void) saveAllInBackground:(NSArray *)user_data
{
    [MHBatch saveAll:user_data inBackgroundWithBlock:^(NSError *error){
        // Do Nothing
    }];
}

+ (void) saveAll:(NSArray *)user_data inBackgroundWithBlock:(MHErrorBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        [MHBatch saveAll:user_data error:&error];
        block(error);
    });
}

#pragma mark -
#pragma mark DELETE

+ (void) destroyAll:(NSArray *)user_data error:(NSError *__autoreleasing *)error
{
    [[MHAPIClient sharedAPIClient] destroy:user_data :error];
}

+ (void) destroyAllInBackground:(NSArray *)user_data
{
    [MHBatch destroyAll:user_data inBackgroundWithBlock:^(NSError *error){
        // Do Nothing
    }];
}

+ (void) destroyAll:(NSArray *)user_data inBackgroundWithBlock:(MHErrorBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        [MHBatch destroyAll:user_data error:&error];
        block(error);
    });
}

@end
