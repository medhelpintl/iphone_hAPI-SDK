//
//  MHAPIClient.m
//  hAPI SDK
//
//  Created by Charles Fisher on 12/17/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import "MHAPIClient.h"

#import "MHRequest.h"
#import "MHLoginClient.h"

@implementation MHAPIClient

#pragma mark -
#pragma mark SINGLETON

+ (id)sharedAPIClient {
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
    
// Convert to JSON Array
    NSMutableArray *json_user_data = [NSMutableArray array];
    for (MHObject *obj in user_data) {
        [json_user_data addObject:[obj getAsDictionary]];
    }

    DLog(@"JSON: %@", json_user_data);
    
// Perform Request
    MHRequest *request = [[MHRequest alloc] initWithEndPoint:[NSString stringWithFormat:@"/users/%@/vitals", [[MHLoginClient sharedLoginClient] userID]]];
    [request setBody:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:json_user_data options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]];
//    [request setPost];
//    [request setParams:[NSDictionary dictionaryWithObject:@"application/json" forKey:@"Content-Type"]];
    NSArray *response = (NSArray *)[request start:error];

    DLog(@"Response: %@", response);
        
// Manage Response
    for (int i = 0; i < response.count; i++) {
        NSDictionary *response_obj = [response objectAtIndex:i];
        MHObject *obj = [user_data objectAtIndex:i];
        
        NSString *identifier = [response_obj objectForKey:@"id"];
        NSDictionary *error = [response_obj objectForKey:@"error"];
        NSString *clientID = [response_obj objectForKey:@"external_id"];
        
        DLog(@"%@, %@, %@", identifier, error, clientID);
        
        [obj setUniqueId:identifier];
        
        DLog(@"New Obj: %@", obj.data);
    }
}

- (void) update:(NSArray*) user_data :(NSError *__autoreleasing *)error
{
    DLog(@"Update: %@", user_data);
    
// Convert to JSON Array
    NSMutableArray *json_user_data = [NSMutableArray array];
    for (MHObject *obj in user_data) {
        [json_user_data addObject:obj.data];
    }
    
    DLog(@"JSON: %@", json_user_data);
// Perform Request
    MHRequest *request = [[MHRequest alloc] initWithEndPoint:[NSString stringWithFormat:@"/users/%@/vitals", [[MHLoginClient sharedLoginClient] userID]]];
    [request setBody:[NSString stringWithFormat:@"%@", json_user_data]];
//    [request setPut];
    NSArray *response = (NSArray *)[request start:error];
    
// Manage Response
    for (int i = 0; i < response.count; i++) {
        NSDictionary *response_obj = [response objectAtIndex:i];
        MHObject *obj = [user_data objectAtIndex:i];
        
        NSString *identifier = [response_obj objectForKey:@"id"];
        BOOL ignored = [[response_obj objectForKey:@"ignored"] boolValue];
        NSDictionary *error = [response_obj objectForKey:@"errors"];
        NSString *clientID = [response_obj objectForKey:@"external_id"];
        
        DLog(@"%@, %i, %@, %@", identifier, ignored, error, clientID);
        
        [obj setUniqueId:identifier];
    }

}

- (NSArray*) read:(NSArray *)field_names :(NSDate *)startDate :(NSDate *)endDate :(NSDate *)updatedDate :(NSError *__autoreleasing *)error
{
//    STATELESS
    DLog(@"READ %@, %@, %@, %@", field_names, startDate, endDate, updatedDate);
    
// Perform Request
    MHRequest *request = [[MHRequest alloc] initWithEndPoint:[NSString stringWithFormat:@"/users/%@/vitals", [[MHLoginClient sharedLoginClient] userID]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            field_names, @"field_names",
                            startDate, @"start_date",
                            endDate, @"end_date",
                            updatedDate, @"updated_after",
                            @0, @"limit",
                            @0, @"offset",
                            @0, @"page",
                            @100, @"per_page",
                            nil];
    [request setParams:params];

    NSDictionary *response = (NSDictionary *)[request start:error];

    int page = [[response objectForKey:@"page"] intValue];
    int per_page = [[response objectForKey:@"per_page"] intValue];
    int pages = [[response objectForKey:@"pages"] intValue];
    int offset = [[response objectForKey:@"offset"] intValue];
    int limit = [[response objectForKey:@"limit"] intValue];
    int total = [[response objectForKey:@"total"] intValue];
    NSString *query_id = [response objectForKey:@"query_id"];
    NSArray *json_user_data = (NSArray*) [response objectForKey:@"data"];
   
    DLog(@"%i, %i, %i, %i, %i, %i, %@, %@", page, per_page, pages, offset, limit, total, query_id, json_user_data);
    
    // Check for more calls
//    STATEFUL
//    set page
//    set per_page 100
//    set pages 1
//    set query_id
    if (pages > 1) {
        for (int i = 1; i < pages; i++) {
            MHRequest *request = [[MHRequest alloc] initWithEndPoint:[NSString stringWithFormat:@"/users/%@/vitals", [[MHLoginClient sharedLoginClient] userID]]];
            NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                                    query_id, @"quer_id",
                                    i, @"page",
                                    nil];
            [request setParams:params];

            response = (NSDictionary *)[request start:error];
            
            NSArray *more_json_user_data = (NSArray*) [response objectForKey:@"data"];
            json_user_data = [json_user_data arrayByAddingObjectsFromArray:more_json_user_data];
        }
    }
    
    
    NSMutableArray *user_data = [NSMutableArray array];
    for (NSDictionary *json_data in json_user_data) {
        MHHealthData *healthData = [[MHHealthData alloc] initWithDictionary:json_data];
        [user_data addObject:healthData];
    }
    
    return user_data;
}

- (MHHealthData*) read:(NSString *)identifier :(NSError *__autoreleasing *)error
{
    return nil;
}

// delete
- (void) destroy:(NSArray *)user_data :(NSError *__autoreleasing *)error
{
    DLog(@"Destroy: %@", user_data);
// Convert to JSON Array
    NSMutableArray *json_user_data = [NSMutableArray array];
    for (MHObject *obj in user_data) {
        [json_user_data addObject:obj.data];
    }

// Perform Request
    MHRequest *request = [[MHRequest alloc] initWithEndPoint:[NSString stringWithFormat:@"/users/%@/vitals", [[MHLoginClient sharedLoginClient] userID]]];
    [request setBody:[NSString stringWithFormat:@"%@", json_user_data]];
    //    [request setDelete];
    NSArray *response = (NSArray *)[request start:error];

    // Manage Response
    for (int i = 0; i < response.count; i++) {
        NSDictionary *response_obj = [response objectAtIndex:i];
        MHObject *obj = [user_data objectAtIndex:i];
        
        NSString *identifier = [response_obj objectForKey:@"id"];
        BOOL deleted = [[response_obj objectForKey:@"deleted"] boolValue];
      
        DLog(@"%@, %i", identifier, deleted);
        
        // updated deleted
    }
}


@end