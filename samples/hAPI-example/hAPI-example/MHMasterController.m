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
#import "MHReadViewController.h"

@interface MHMasterController()
@property (nonatomic, strong) UINavigationController *homeNavController;

@property (nonatomic, strong) MHReadViewController *readController;
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
        self.readController = [[MHReadViewController alloc] initWithNibName:@"MHReadViewController" bundle:nil];
        self.homeController = [[MHViewController alloc] initWithNibName:@"MHViewController" bundle:nil];
        self.loginController = [[MHLoginViewController alloc] initWithNibName:@"MHLoginViewController" bundle:nil];

        self.homeNavController = [[UINavigationController alloc] initWithRootViewController:self.homeNavController];
        // Color
        [self.homeNavController.navigationBar setTintColor:[UIColor blackColor]];
        // Logo
        UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"medHelp_loading_grey"]];
        [logo setFrame:CGRectMake(self.homeNavController.view.frame.size.width - 20, self.homeNavController.view.frame.size.height - 20, 15, 15)];
        [self.homeNavController.view addSubview:logo];
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
    window.rootViewController = self.homeNavController;
    
    [self.homeNavController setViewControllers:[NSArray arrayWithObject:self.homeController] animated:self.homeNavController.viewControllers.count > 1];
    
    // Dismiss Login if it exists...
    [self.homeController dismissViewControllerAnimated:YES completion:^(void) {}];
}

- (void) read
{
    [self home];
    [self.homeNavController pushViewController:self.readController animated:YES];
}

- (void) login
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    [window.rootViewController presentViewController:self.loginController animated:YES completion:^(void) {}];
}

@end
