//
//  MHSessionManager.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/11/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MHLoginManager.h"

@interface MHSessionManager : NSObject

@property (nonatomic, strong) MHLoginManager *loginManager;

+ (MHSessionManager*) sharedManager;

@end
