//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MHHealthDataDelegate;

//Or UserData?
@interface MHHealthData : NSObject
+ (NSArray*)queryForUser:(NSString*)userName withDataTypes:(NSArray*)dataTypes fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;
- (BOOL)save;
- (BOOL)saveInBackground;
- (void)saveInBackgroundWithBlock:(MHBooleanResultBlock)block;
- (BOOL)destroy;
- (BOOL)destroyInBackground;
- (void)destroyInBackgroundWithBlock:(MHBooleanResultBlock)block;
//- ( void )myMethodTakingPredicate: ( BOOL ( ^ )( int ) )predicate;
@property (nonatomic, strong) NSString *uniqueId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *relativeId;
@property (nonatomic, strong) NSString *fieldName;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *sourceType;
@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, weak) id value;
@property (nonatomic, weak) id<MHHealthDataDelegate> delegate;
@end

////////////////////////////////////////////////////////////////////////////////
// These methods can be used as callbacks for -save and -saveInBackground
/*
 *Your application should implement this delegate when saving or destroying data without a block
 */
@protocol MHHealthDataDelegate <NSObject>

@optional

/**
 * Called just before the health data is sent to the server.
 */
- (void)willSave:(MHHealthData *)healthData;

/**
 * Called after the healthData is saved.
 */
- (void)didSave:(MHHealthData *)healthData;

/**
 * Called if the 
 */
- (void)saveDidFail:(MHHealthData*)healthData withError:(NSError*)error;


/**
 * Called just before the health data is sent to the server.
 */
- (void)willDestroy:(MHHealthData *)healthData;

/**
 * Called after the healthData is saved.
 */
- (void)didDestroy:(MHHealthData *)healthData;

/**
 * Called if the
 */
- (void)destroyDidFail:(MHHealthData*)healthData withError:(NSError*)error;



@end
