//
//  MHHealthData.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 12/4/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHHealthData.h"
#import "MHAPIClient.h"

#define kUserID @"user_id"
#define kRelativeID @"relative_id"
#define kDate @"date"
#define kTime @"time"
#define kFieldName @"field_name"
#define kValue @"value"
#define kUpdatedAt @"updated_at"
#define kCreatedAt @"created_at"
#define kImmutable @"immutable"

@implementation MHHealthData
@dynamic userId;
@dynamic relativeId;
@dynamic date;
@dynamic time;
@dynamic field_name;
@dynamic value;
@dynamic updated_at;
@dynamic created_at;
@dynamic immutable;

#pragma mark -
#pragma mark PROPERTIES

- (NSString*) userId
{
    return [self valueForKey:kUserID];
}

- (NSString*) relativeId
{
    return [self valueForKey:kRelativeID];
}

- (NSString*) date
{
    return [self valueForKey:kDate];
}

- (void) setDate:(NSString *)date
{
    [self.data setValue:date forKey:kDate];
    [self setUpdated_at:[NSDate date]];
}

- (NSString*) time
{
    return [self valueForKey:kTime];
}

- (void) setTime:(NSString *)time
{
    [self.data setValue:time forKey:kTime];
    [self setUpdated_at:[NSDate date]];
}

- (NSString*) field_name
{
    return [self valueForKey:kFieldName];
}

- (void) setField_name:(NSString *)field_name
{
    [self.data setValue:field_name forKey:kFieldName];
    [self setUpdated_at:[NSDate date]];
}

- (id) value
{
    return [self valueForKey:kValue];
}

- (void) setValue:(id)value
{
    [self.data setValue:value forKey:kValue];
    [self setUpdated_at:[NSDate date]];
}

- (NSDate*) updated_at
{
    return [self valueForKey:kUpdatedAt];
}

- (void) setUpdated_at:(NSDate *)updated_at
{
    [self.data setValue:updated_at forKey:kUpdatedAt];
}

- (NSDate*) created_at
{
    return [self valueForKey:kCreatedAt];
}

- (BOOL) immutable
{
    return [[self valueForKey:kImmutable] boolValue];
}

#pragma mark -
#pragma mark INIT


- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)initWithFieldName:(NSString*)fieldName forValue:(id)value {
    if (self = [super init]) {
        self.field_name = fieldName;
        self.value = value;
    }
    return self;
}

+ (MHHealthData*)healthDataWithId:(NSString*)uniqueId
{
#warning Query?
    return [[MHHealthData alloc] initWithID:uniqueId];
}

@end
