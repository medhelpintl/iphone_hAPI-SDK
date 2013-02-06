//
//  MHViewController.m
//  hAPI-example
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import "MHViewController.h"

#import <hAPI SDK/MedHelp.h>

#import "MHMasterController.h"

@interface MHViewController ()
@property (nonatomic, strong) MHHealthData *weight;
@end

@implementation MHViewController

#pragma mark -
#pragma mark VIEW LIFECYCLE

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"MedHelp hAPI";
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self getWeight];
}

#pragma mark -
#pragma mark WEIGHT

- (void) getWeight
{
    [MHQuery getLatestUserData:@"Weight" inBackgroundWithBlock:^(MHHealthData *user_data, NSError *error){
        self.weight = user_data;
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self updateUI];
        });
    }];
}

- (void) updateUI
{
    self.updateWeightTextField.text = @"";
    self.addWeightTextField.text = @"";

    if (self.weight) {
        //
        self.latestWeightLbl.text = [NSString stringWithFormat:@"%@", self.weight.value];
        self.updateWeightBtn.enabled = YES;
        self.updateWeightTextField.enabled = YES;
        self.deleteWeightBtn.enabled = YES;
    } else {
        // No Weight
        self.latestWeightLbl.text = @"--";
        self.updateWeightBtn.enabled = NO;
        self.updateWeightTextField.enabled = NO;
        self.deleteWeightBtn.enabled = NO;
    }
}

- (IBAction)updateWeight:(id)sender
{
    [self.view endEditing:YES];
    
    float weight = [self.updateWeightTextField.text floatValue];
    
    [self.weight setValue:[NSNumber numberWithFloat:weight]];
    [self.weight saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self getWeight];
        } else {
            NSLog(@"Error: %@", error);
            // Pop up
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [[[UIAlertView alloc] initWithTitle:@"MedHelp" message:@"Failed to Update Weight" delegate:nil cancelButtonTitle:@"Darn" otherButtonTitles:nil] show];
            });
        }
    }];
}

- (IBAction)newWeight:(id)sender
{
    [self.view endEditing:YES];
    
    float weight = [self.addWeightTextField.text floatValue];
    
    MHHealthData *newWeight = [[MHHealthData alloc] initWithFieldName:@"Weight" forValue:[NSNumber numberWithFloat:weight]];
    [newWeight saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self getWeight];
        } else {
            NSLog(@"Error: %@", error);
            // Pop up
            [[[UIAlertView alloc] initWithTitle:@"MedHelp" message:@"Failed to Save Weight" delegate:nil cancelButtonTitle:@"Darn" otherButtonTitles:nil] show];
        }
    }];
}

- (IBAction)deleteWeight:(id)sender
{
    [self.weight destroyInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self getWeight];
        } else {
            NSLog(@"Error: %@", error);
            // Pop up
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [[[UIAlertView alloc] initWithTitle:@"MedHelp" message:@"Failed to Delete Weight" delegate:nil cancelButtonTitle:@"Darn" otherButtonTitles:nil] show];
            });
        }
    }];
}

#pragma mark -
#pragma mark DATA

- (IBAction)read:(id)sender
{
    [self.view endEditing:YES];
    
    [[MHMasterController sharedMasterControl] read];
}

#pragma mark -
#pragma mark AUTH

- (IBAction)logout:(id)sender
{
    [self.view endEditing:YES];
    
    [MedHelp logout:^(NSError *error) {
        if (error == nil) {
            [[MHMasterController sharedMasterControl] login];
        } else {
            NSLog(@"Error: %@", error);
            // Pop up
            [[[UIAlertView alloc] initWithTitle:@"MedHelp" message:@"Failed to Logout" delegate:nil cancelButtonTitle:@"Darn" otherButtonTitles: nil] show];
        }
    }];
}

@end
