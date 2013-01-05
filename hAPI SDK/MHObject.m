//
//  MHHealthData.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHObject.h"
#import "MHAPIClient.h"

#define kUniqueID @"id"
#define kClientID @"external_id"
#define kDeleted @"deleted"

@interface MHObject()
@property (nonatomic, strong) NSMutableDictionary *data;
@end

@implementation MHObject
@synthesize data;
@dynamic uniqueId;
@dynamic clientId;
@dynamic deleted;

#pragma mark -
#pragma mark PROPERTIES

- (NSString*) uniqueId
{
    return [self valueForKey:kUniqueID];
}

- (NSString*) clientId
{
    return [self valueForKey:kClientID];
}

- (BOOL) deleted
{
    NSNumber *deleted = [self valueForKey:kDeleted];
    return [deleted boolValue];
}

- (id) valueForKey:(NSString *)key
{
    return [self.data objectForKey:key];
}

#pragma mark -
#pragma mark INIT

- (id)init
{
    if (self = [super init]) {
        self.data = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -
#pragma mark SAVE

// to be moved....
+ (BOOL) saveAll:(NSArray *)user_data
{
    NSArray *update_user_data = [NSArray array];
    NSArray *create_user_data = [NSArray array];
    
    // Check Create vs. Update
    [[MHAPIClient sharedAPIClient] update:update_user_data];
    [[MHAPIClient sharedAPIClient] create:create_user_data];
    
    return YES;
}

- (BOOL)save:(NSError**)error {

    BOOL success = YES;
    if (self.uniqueId) {
        [[MHAPIClient sharedAPIClient] update:[NSArray arrayWithObject:self]];
    } else {
        [[MHAPIClient sharedAPIClient] create:[NSArray arrayWithObject:self]];
    }
    
    return success;
}
- (void)saveInBackground {
    [self saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        // Do Nothing
    }];    
}

- (void)saveInBackgroundWithBlock:(MHBooleanResultBlock)block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        BOOL successful = [self save:&error];
        block(successful, error);
    });
}

- (BOOL)destroy:(NSError *__autoreleasing *)error {
    BOOL successful = YES;
    
    [[MHAPIClient sharedAPIClient] destroy:[NSArray arrayWithObject:self]];
    
    if (successful) {
        [self.data setValue:[NSNumber numberWithBool:YES] forKey:kDeleted];
    }
    
    return successful;
}

- (void)destroyInBackground {
    [self destroyInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        // Do Nothing
    }];
}

- (void)destroyInBackgroundWithBlock:(MHBooleanResultBlock)block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        BOOL successful = [self destroy:&error];
        block(successful, error);
    });
}

@end
