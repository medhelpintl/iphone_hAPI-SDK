//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GlobalConstants.h"

@interface MHObject : NSObject

- (BOOL)save:(NSError**)error;
- (void)saveInBackground;
- (void)saveInBackgroundWithBlock:(MHBooleanResultBlock)block;
- (BOOL)destroy:(NSError**)error;
- (void)destroyInBackground;
- (void)destroyInBackgroundWithBlock:(MHBooleanResultBlock)block;

@property (nonatomic, readonly) NSString *medhelpId;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, readonly) BOOL deleted;
//
@property (nonatomic, assign) BOOL saved;
@property (nonatomic, strong) NSString *statusMessage;

// HELPER
- (NSDictionary*) getAsDictionary;
// INIT
- (id) initWithDictionary:(NSDictionary*)data;
- (id) initWithID:(NSString*)clientId;

@end