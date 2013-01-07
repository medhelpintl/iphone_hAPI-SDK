//
//  MHAPIClient.h
//  hAPI SDK
//
//  Created by Charles Fisher on 12/17/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MHHealthData.h"

@interface MHAPIClient : NSObject

+ (MHAPIClient*) sharedAPIClient;

- (void) create:(NSArray*)user_data :(NSError**)error;
- (void) update:(NSArray*)user_data :(NSError**)error;
- (NSArray*) read:(NSArray*)field_names :(NSDate*)startDate :(NSDate*)endDate :(NSDate*)updatedDate :(NSError**)error;
- (MHHealthData*) read:(NSString*)identifier :(NSError**)error;
- (void) destroy:(NSArray*)user_data :(NSError**)error;

@end
