//
//  MHAPIClient.m
//  hAPI SDK
//
//  Created by Charles Fisher on 12/17/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHAPIClient.h"

@implementation MHAPIClient

#pragma mark -
#pragma mark SINGLETON

+ (id)sharedInstance {
    static MHAPIClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[MHAPIClient alloc] init];
    });
    return __sharedInstance;
}

#pragma mark -
#pragma mark INIT

- (id) init
{
    if (self = [super init]) {
        //
    }
    return self;
}

#pragma mark -
#pragma mark API

- (void) create:(NSArray*) user_data :(NSError *__autoreleasing *)error
{
    DLog(@"Create: %@", user_data);
}

- (void) update:(NSArray*) user_data :(NSError *__autoreleasing *)error
{
    DLog(@"Update: %@", user_data);
}

- (NSArray*) read:(NSArray *)field_names :(NSDate *)startDate :(NSDate *)endDate :(NSDate *)updatedDate :(NSError *__autoreleasing *)error
{
    DLog(@"READ %@, %@, %@, %@", field_names, startDate, endDate, updatedDate);
    
//    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:@"2011-01-01", @"start_date", nil];
//    [[MHAPIClient sharedInstance] getPath:[NSString stringWithFormat:@"users/%@/vitals",@"661977"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"reponse %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
//        NSLog(@"Error %@", error);
//    }];

    
    return [NSArray array];
}

- (MHHealthData*) read:(NSString *)identifier :(NSError *__autoreleasing *)error
{
    return nil;
}

// delete
- (void) destroy:(NSArray *)user_data :(NSError *__autoreleasing *)error
{
    DLog(@"Destroy: %@", user_data);
}


@end
