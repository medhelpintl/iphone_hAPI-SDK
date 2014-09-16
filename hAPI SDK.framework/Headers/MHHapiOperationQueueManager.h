//
//  MHHapiOperationQueueManager.h
//  hAPI SDK
//
//  Created by Rick Donald on 9/11/14.
//  Copyright (c) 2014 MedHelp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MHHapiOperation : NSOperation

@property (nonatomic, strong) NSError *error;

- (id)initWithMHObject:(MHObject*)object;

@end


@interface MHHapiBatchOperation : NSOperation

- (id)initWithMHObjects:(NSArray*)objectArray;

@end



@interface MHHapiOperationQueueManager : NSObject

+ (MHHapiOperationQueueManager*) sharedManager;

- (void)addOperation:(NSOperation*)operation;

@end
