//
//  MHQuery.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MHHealthData.h"

@interface MHQuery : NSObject

#pragma mark - Single User_Data
+ (MHHealthData*) getUserDataWithID:(NSString*)identifier;
+ (void) getUserDataWithID:(NSString*)identifier inBackgroundWithBlock:(MHHealthDataResultBlock)block;

#pragma mark - Multiple User_Data
+ (NSArray*) queryUserDataForFields:(NSArray*) field_names fromDate:(NSDate*)startDate toDate:(NSDate*)endDate;
+ (NSArray*) queryUserDataForFields:(NSArray*) field_names fromDate:(NSDate*)startDate toDate:(NSDate*)endDate updatedAfter:(NSDate*)updatedDate;
+ (void) queryUserDataForFields:(NSArray*) field_names fromDate:(NSDate*)startDate toDate:(NSDate*)endDate inBackgroundWithBlock:(MHArrayResultBlock)block;
+ (void) queryUserDataForFields:(NSArray*) field_names fromDate:(NSDate*)startDate toDate:(NSDate*)endDate updatedAfter:(NSDate*)updatedDate inBackgroundWithBlock:(MHArrayResultBlock)block;


@end
