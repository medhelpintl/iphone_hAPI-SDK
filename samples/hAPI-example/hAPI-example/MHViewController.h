//
//  MHViewController.h
//  hAPI-example
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *latestWeightLbl;
@property (nonatomic, strong) IBOutlet UITextField *updateWeightTextField;
@property (nonatomic, strong) IBOutlet UITextField *addWeightTextField;
@property (nonatomic, strong) IBOutlet UIButton *updateWeightBtn;
@property (nonatomic, strong) IBOutlet UIButton *addWeightBtn;

- (IBAction)updateWeight:(id)sender;
- (IBAction)newWeight:(id)sender;

- (IBAction)read:(id)sender;
- (IBAction)logout:(id)sender;

@end
