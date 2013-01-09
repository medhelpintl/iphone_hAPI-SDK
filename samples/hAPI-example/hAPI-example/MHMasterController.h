//
//  MHMasterController.h
//  hAPI-example
//
//  Created by Charles Fisher on 1/9/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHMasterController : NSObject

+ (MHMasterController*) sharedMasterControl;

- (void) login;
- (void) home;

@end
