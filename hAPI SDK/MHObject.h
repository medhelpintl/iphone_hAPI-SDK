//
//  MHHealthData.h
//  hAPI SDK
//
//  Created by Winfred Raguini on 11/30/12.
//  Copyright (c) 2012 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MHObjectDelegate;

//Or UserData?
@interface MHObject : NSObject
- (BOOL)save:(NSError**)error;
- (BOOL)saveInBackground:(NSError**)error;
- (void)saveInBackgroundWithBlock:(MHBooleanResultBlock)block;
- (BOOL)destroy;
- (BOOL)destroyInBackground;
- (void)destroyInBackgroundWithBlock:(MHBooleanResultBlock)block;
//- ( void )myMethodTakingPredicate: ( BOOL ( ^ )( int ) )predicate;
@property (nonatomic, strong) NSString *uniqueId;
@property (nonatomic, weak) id <MHObjectDelegate> delegate;
@end

////////////////////////////////////////////////////////////////////////////////
// These methods can be used as callbacks for -save and -saveInBackground
/*
 *Your application should implement this delegate when saving or destroying data without a block
 */
@protocol MHObjectDelegate <NSObject>

@optional

/**
 * Called just before the health data is sent to the server.
 */
- (void)willSave:(MHObject *)healthData;

/**
 * Called after the healthData is saved.
 */
- (void)didSave:(MHObject *)healthData;

/**
 * Called if the 
 */
- (void)saveDidFail:(MHObject*)healthData withError:(NSError*)error;


/**
 * Called just before the health data is sent to the server.
 */
- (void)willDestroy:(MHObject *)healthData;

/**
 * Called after the healthData is saved.
 */
- (void)didDestroy:(MHObject *)healthData;

/**
 * Called if the
 */
- (void)destroyDidFail:(MHObject*)healthData withError:(NSError*)error;



@end
