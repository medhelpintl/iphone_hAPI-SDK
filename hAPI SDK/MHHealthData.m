//
//  MHHealthData.m
//  hAPI SDK
//
//  Created by Winfred Raguini on 12/4/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHHealthData.h"
#import "MHAPIClient.h"

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
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:@"2011-01-01", @"start_date", nil];
    [[MHAPIClient sharedInstance] getPath:[NSString stringWithFormat:@"users/%@/vitals",@"661977"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"reponse %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"Error %@", error);
    }];
    
    return [NSArray array];
}

+ (MHHealthData*)healthDataWithId:(NSString*)uniqueId
{
    return [[MHHealthData alloc] init];
}

@end
