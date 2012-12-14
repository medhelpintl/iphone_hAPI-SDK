//
//  MHHealthData.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 12/4/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHHealthData.h"

@implementation MHHealthData
@synthesize userId = userId_;
@synthesize relativeId = relativeId_;
@synthesize timeStamp = timeStamp_;
@synthesize fieldName = fieldName_;
@synthesize category = category_;
@synthesize sourceType = sourceType_;
@synthesize sourceId = sourceId_;
@synthesize value = value_;

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)initWithFieldName:(NSString*)fieldName forValue:(id)value {
    if (self = [super init]) {
        
    }
    return self;
}


+ (NSArray*)queryWithUserId:(NSString*)userId forFields:(NSArray*)fieldNames fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate
{
    return [NSArray array];
}

+ (MHHealthData*)healthDataWithId:(NSString*)uniqueId
{
    return [[MHHealthData alloc] init];
}

@end
