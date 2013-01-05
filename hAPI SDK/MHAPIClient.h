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

- (void) create:(NSArray*)user_data;
- (void) update:(NSArray*)user_data;
- (NSArray*) read:(NSDate*)startDate :(NSDate*)endDate;
- (void) destroy:(NSArray*)user_data;

@end
