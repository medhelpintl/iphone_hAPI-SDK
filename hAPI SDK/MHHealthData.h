//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 12/4/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHObject.h"

@interface MHHealthData : MHObject
- (id)initWithFieldName:(NSString*)fieldName forValue:(id)value;
+ (MHHealthData*)healthDataWithId:(NSString*)uniqueId;

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *relativeId;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, strong) NSString *field_name;
@property (nonatomic, weak) id value;
@property (nonatomic, readonly) NSDate *updated_at;
@property (nonatomic, readonly) NSDate *created_at;
@property (nonatomic, readonly) BOOL immutable;

// Helper
- (void) setDateWithNSDate:(NSDate*)date;
- (void) setTimeWithNSDate:(NSDate*)time;
- (NSDate*) getTimeAsNSDate;

+ (NSArray*)queryWithUserId:(NSString*)userId forFields:(NSArray*)fieldNames fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;

@end
