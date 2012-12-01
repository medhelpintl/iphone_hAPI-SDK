//
//  MHHealthData.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHHealthData.h"

@implementation MHHealthData


- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

+ (NSArray*)queryForUser:(NSString*)userName withDataTypes:(NSArray*)dataTypes fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate {
    return [NSArray array];
}
- (BOOL)save:(NSError**)error {
    BOOL successful = YES;
    
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:@"Failed to save because of something" forKey:NSLocalizedDescriptionKey];
    [errorDetail setValue:@"something" forKey:@"kReceivedData"];
    *error = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];
    
    if (successful) {
        if ([self.delegate respondsToSelector:@selector(didSave:)]) {
            [self.delegate performSelector:@selector(didSave:) withObject:self];
        }
    }
    return successful;
}
- (BOOL)saveInBackground:(NSError**)error {
    BOOL successful = YES;
    
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:@"Failed to save because of something" forKey:NSLocalizedDescriptionKey];
    [errorDetail setValue:@"something" forKey:@"kReceivedData"];
    *error = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];
    
    if (successful) {
        if ([self.delegate respondsToSelector:@selector(didSave:)]) {
            [self.delegate performSelector:@selector(didSave:) withObject:self];
        }
    }
    return successful;
}

- (void)saveInBackgroundWithBlock:(MHBooleanResultBlock)block {
    NSError *error = nil;
    block([self saveInBackground:&error], error);
}

- (BOOL)destroy {
    BOOL successful = YES;
    return successful;
}
- (BOOL)destroyInBackground {
    return YES;
}
- (void)destroyInBackgroundWithBlock:(MHBooleanResultBlock)block {
    
}

@end
