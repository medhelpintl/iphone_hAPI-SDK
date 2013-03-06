//
//  MHObjectCollection.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/10/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHBatch : NSObject

+ (void)save:(NSArray*)user_data error:(NSError**)error;
+ (void)saveInBackground:(NSArray*)user_data;
+ (void)save:(NSArray *)user_data inBackgroundWithBlock:(MHErrorBlock)block;
+ (void)destroy:(NSArray*)user_data error:(NSError**)error;
+ (void)destroyInBackground:(NSArray*)user_data;
+ (void)destroy:(NSArray *)user_data inBackgroundWithBlock:(MHErrorBlock)block;

@end
