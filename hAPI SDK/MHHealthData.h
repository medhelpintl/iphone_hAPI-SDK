//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 12/4/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHObject.h"

@interface MHHealthData : MHObject

// Defaults to Now
- (id)initWithFieldName:(NSString*)fieldName forValue:(id)value;

- (id)initWithFieldName:(NSString *)fieldName forValue:(id)value andDate:(NSDate*)date;
- (id)initWithFieldName:(NSString *)fieldName forValue:(id)value andDate:(NSDate *)date andRelativeID:(NSString*)relativeId;

@property (nonatomic, readonly) NSString *userId;
@property (nonatomic, readonly) NSString *relativeId;
@property (nonatomic, readonly) NSString *date;
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, readonly) NSString *field_name;
@property (nonatomic, weak) id value;
@property (nonatomic, readonly) NSDate *updated_at;
@property (nonatomic, readonly) NSDate *created_at;
@property (nonatomic, readonly) BOOL immutable;

// Helper
- (void) setDateWithNSDate:(NSDate*)date;
- (void) setTimeWithNSDate:(NSDate*)time;
- (NSDate*) getTimeAsNSDate;

@end
