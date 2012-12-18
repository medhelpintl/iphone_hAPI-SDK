//
//  MHHealthData.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHObject.h"
#import "MHAPIClient.h"

@implementation MHObject
@synthesize uniqueId = uniqueId_;
@synthesize delegate = delegate_;

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

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
    
    return [MHObject saveAll:[NSArray arrayWithObject:self]];
    
//    BOOL successful = YES;
//    
//    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
//    [errorDetail setValue:@"Failed to save because of something" forKey:NSLocalizedDescriptionKey];
//    [errorDetail setValue:@"something" forKey:@"kReceivedData"];
//    *error = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];
//    
//    if (successful) {
//        if ([self.delegate respondsToSelector:@selector(didSave:)]) {
//            [self.delegate performSelector:@selector(didSave:) withObject:self];
//        }
//    }
//    return successful;
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
