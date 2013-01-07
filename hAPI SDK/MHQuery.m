//
//  MHQuery.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "MHQuery.h"

#import "MHAPIClient.h"

@implementation MHQuery

#pragma mark -
#pragma mark MHHealthData

+ (MHHealthData*) getUserDataWithID:(NSString *)identifier
{
    NSError *error = nil;
    return [[MHAPIClient sharedAPIClient] read:identifier :&error];
}

+ (void) getUserDataWithID:(NSString *)identifier inBackgroundWithBlock:(MHHealthDataResultBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        MHHealthData *user_data = [MHQuery getUserDataWithID:identifier];
        block(user_data, error);
    });
}

#pragma mark -
#pragma mark ARRAY

+ (NSArray*) queryUserDataForFields:(NSArray *)field_names fromDate:(NSDate *)startDate toDate:(NSDate *)endDate
{
    return [MHQuery queryUserDataForFields:field_names fromDate:startDate toDate:endDate updatedAfter:nil];
}

+ (NSArray*) queryUserDataForFields:(NSArray *)field_names fromDate:(NSDate *)startDate toDate:(NSDate *)endDate updatedAfter:(NSDate *)updatedDate
{
    NSError *error = nil;
    return [[MHAPIClient sharedAPIClient] read:field_names :startDate :endDate :updatedDate :&error];
}

+ (void) queryUserDataForFields:(NSArray *)field_names fromDate:(NSDate *)startDate toDate:(NSDate *)endDate inBackgroundWithBlock:(MHArrayResultBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        NSArray *user_data = [MHQuery queryUserDataForFields:field_names fromDate:startDate toDate:endDate];
        block(user_data, error);
    });
}

+ (void) queryUserDataForFields:(NSArray *)field_names fromDate:(NSDate *)startDate toDate:(NSDate *)endDate updatedAfter:(NSDate *)updatedDate inBackgroundWithBlock:(MHArrayResultBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        NSError *error = nil;
        NSArray *user_data = [MHQuery queryUserDataForFields:field_names fromDate:startDate toDate:endDate updatedAfter:updatedDate];
        block(user_data, error);
    });
}

@end
