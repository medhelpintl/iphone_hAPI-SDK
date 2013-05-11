//
//  MHAppDelegate.m
//  hAPI-example
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import "MHAppDelegate.h"
#import "MHViewController.h"
#import "MHMasterController.h"

#import <hAPI SDK/MedHelp.h>

@implementation MHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    // Not the best way for initializing the window...
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    [MedHelp setBaseURL:@"https://hapi.medhelp.ws"]; // This the default value, and does not need to be set
    [MedHelp startWithClientID:@"hd42sRGKw5f5bAYEWAiiyyKTfwIh8X77" clientSecret:@"Dvi6xFlbUlziGgk1"];
    
    [[MHMasterController sharedMasterControl] home];
    if (![MedHelp isLoggedIn]) {
        [[MHMasterController sharedMasterControl] login];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [MedHelp loadCallBackURL:url];
    NSLog(@"openURL %@",[url absoluteString]);
    NSLog(@"sourceApplication %@", sourceApplication);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
