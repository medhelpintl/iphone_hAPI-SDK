//
//  MHReadViewController.h
//  hAPI-example
//
//  Created by Charles Fisher on 1/9/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHReadViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
