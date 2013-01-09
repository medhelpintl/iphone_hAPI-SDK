//
//  MHMasterController.m
//  hAPI-example
//
//  Created by Charles Fisher on 1/9/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import "MHMasterController.h"

#import "MHLoginViewController.h"
#import "MHViewController.h"

@interface MHMasterController()
@property (nonatomic, strong) MHViewController *homeController;
@property (nonatomic, strong) MHLoginViewController *loginController;
@end

@implementation MHMasterController

#pragma mark -
#pragma mark INIT

- (id) init
{
    if (self = [super init]) {
        //
        self.homeController = [[MHViewController alloc] initWithNibName:@"MHViewController" bundle:nil];
        self.loginController = [[MHLoginViewController alloc] initWithNibName:@"MHLoginViewController" bundle:nil];
    }
    return self;
}

#pragma mark -
#pragma mark SINGLETON

+ (MHMasterController*) sharedMasterControl
{
    static MHMasterController *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[MHMasterController alloc] init];
    });
    return __sharedInstance;

}

#pragma mark -
#pragma mark NAVIGATION

- (void) home
{
    // Make sure it's root
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = self.homeController;
    
    // Dismiss Login if it exists...
    [self.homeController dismissViewControllerAnimated:YES completion:^(void) {}];
}

- (void) login
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    [window.rootViewController presentViewController:self.loginController animated:YES completion:^(void) {}];
}

@end
