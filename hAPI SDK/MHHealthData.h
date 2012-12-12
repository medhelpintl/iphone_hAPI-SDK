//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 12/4/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHObject.h"

@interface MHHealthData : MHObject
+ (id)initWithFieldName:(NSString*)fieldName forValue:(id)value;
+ (NSArray*)queryWithUserId:(NSString*)userId forFields:(NSArray*)fieldNames fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;
+ (MHHealthData*)healthDataWithId:(NSString*)uniqueId;

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *relativeId;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) NSString *fieldName;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *sourceType;
@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, weak) id value;
@end
