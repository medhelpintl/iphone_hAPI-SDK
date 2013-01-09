//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHObject : NSObject
// This goes in another object...
+ (BOOL)saveAll:(NSArray*)user_data;

- (BOOL)save:(NSError**)error;
- (void)saveInBackground;
- (void)saveInBackgroundWithBlock:(MHBooleanResultBlock)block;
- (BOOL)destroy:(NSError**)error;
- (void)destroyInBackground;
- (void)destroyInBackgroundWithBlock:(MHBooleanResultBlock)block;


@property (nonatomic, strong) NSString *uniqueId;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, readonly) BOOL deleted;

// HELPER
@property (nonatomic, readonly) NSMutableDictionary *data;
- (NSDictionary*) getAsDictionary;
// INIT
- (id) initWithDictionary:(NSDictionary*)data;
- (id) initWithID:(NSString*)clientId;

@end