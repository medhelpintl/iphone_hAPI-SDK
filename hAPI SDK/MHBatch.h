//
//  MHObjectCollection.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/10/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHBatch : NSObject

+ (void)saveAll:(NSArray*)user_data error:(NSError**)error;
+ (void)saveAllInBackground:(NSArray*)user_data;
+ (void)saveAll:(NSArray *)user_data inBackgroundWithBlock:(MHErrorBlock)block;
+ (void)destroyAll:(NSArray*)user_data error:(NSError**)error;
+ (void)destroyAllInBackground:(NSArray*)user_data;
+ (void)destroyAll:(NSArray *)user_data inBackgroundWithBlock:(MHErrorBlock)block;

@end
