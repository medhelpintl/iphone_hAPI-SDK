//
//  MHViewController.m
//  hAPI-example
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import "MHViewController.h"

#import "MedHelp.h"
#import "MHLoginClient.h"
#import "MHHealthData.h"

#import "MHMasterController.h"

@interface MHViewController ()

@end

@implementation MHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.lbl setText:@"Saving"];
    
    MHHealthData *mhObj = [[MHHealthData alloc] initWithFieldName:@"Weight" forValue:@100];
//    [mhObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        NSLog(@"Success: %i", succeeded);
//        NSLog(@"Error: %@", error);
//        
//        dispatch_async(dispatch_get_main_queue(), ^(void){
//            [self.lbl setText:@"Saved"];
//        });
//    }];
}

#pragma mark -
#pragma mark AUTH

- (IBAction)logout:(id)sender
{
    [[MHLoginClient sharedLoginClient] logout:^(NSError *error) {
        if (error == nil) {
            [[MHMasterController sharedMasterControl] login];
        } else {
            // POp up
        }
    }];
}

@end
