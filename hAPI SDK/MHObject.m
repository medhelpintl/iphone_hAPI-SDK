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

@property (nonatomic, readwrite, assign) BOOL deleted;
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

- (void) setDeleted:(BOOL)deleted
{
    [self.data setValue:[NSNumber numberWithBool:deleted] forKey:kDeleted];
}

- (id) valueForKey:(NSString *)key
{
    return [self.data objectForKey:key];
}

#pragma mark -
#pragma mark JSON HELPER

- (NSDictionary*) getAsDictionary {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    for (NSString *key in [self.data allKeys]) {
        id value = [self.data objectForKey:key];
        if ([value isKindOfClass:[NSDate class]]) {
            value = [dateFormatter stringFromDate:(NSDate*)value];
        }
        
        [dict setObject:value forKey:key];
    }
    
    return dict;
}

#pragma mark -
#pragma mark INIT

- (id)init
{
    if (self = [super init]) {
        self.data = [NSMutableDictionary dictionary];
        
        self.deleted = NO;
    }
    return self;
}

- (id) initWithDictionary:(NSDictionary *)data_
{
    if (self = [super init]) {
        self.data = [NSMutableDictionary dictionaryWithDictionary:data_];
    }
    return self;
}

- (id) initWithID:(NSString *)clientId
{
    return [self initWithDictionary:[NSDictionary dictionaryWithObject:clientId forKey:kClientID]];
}

#pragma mark -
#pragma mark SAVE

// to be moved....
+ (BOOL) saveAll:(NSArray *)user_data
{
    NSError *error = nil;
    NSArray *update_user_data = [NSArray array];
    NSArray *create_user_data = [NSArray array];
    
    // Check Create vs. Update
    [[MHAPIClient sharedAPIClient] update:update_user_data :&error];
    [[MHAPIClient sharedAPIClient] create:create_user_data :&error];
    
    return error == nil;
}

- (BOOL)save:(NSError**)error {
    if (self.uniqueId) {
        [[MHAPIClient sharedAPIClient] update:[NSArray arrayWithObject:self] :error];
    } else {
        [[MHAPIClient sharedAPIClient] create:[NSArray arrayWithObject:self] :error];
    }
    
    return error != nil;
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
    
    [[MHAPIClient sharedAPIClient] destroy:[NSArray arrayWithObject:self] :error];
    
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
