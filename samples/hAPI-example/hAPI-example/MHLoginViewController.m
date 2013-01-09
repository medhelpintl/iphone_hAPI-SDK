//
//  MHLoginViewController.m
//  hAPI-example
//
//  Created by Charles Fisher on 1/9/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import "MHLoginViewController.h"

#import "MHLoginClient.h"
#import "MedHelp.h"

#import "MHMasterController.h"

@interface MHLoginViewController ()

@end

@implementation MHLoginViewController

- (IBAction)login:(id)sender
{
    [[MHLoginClient sharedLoginClient] login:^(NSError *error) {
        if (error == nil) {
            [[MHMasterController sharedMasterControl] home];
        } else {
            // Pop up
        }
    }];
}

@end