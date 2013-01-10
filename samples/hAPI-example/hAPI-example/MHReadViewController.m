//
//  MHReadViewController.m
//  hAPI-example
//
//  Created by Charles Fisher on 1/9/13.
//  Copyright (c) 2013 MedHelp. All rights reserved.
//

#import "MHReadViewController.h"

#import "MedHelp.h"

@interface MHReadViewController ()
@property (nonatomic, strong) NSArray *user_data;
@end

@implementation MHReadViewController

#pragma mark VIEW LIFECYCLE

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Empty Table
    self.user_data = nil;
    [self.tableView reloadData];
    
    // Query Some Data
    [MHQuery queryUserDataForFields:[NSArray arrayWithObject:@"Weight"] fromDate:[NSDate dateWithTimeIntervalSinceNow:-30*24*60*60] toDate:[NSDate date] inBackgroundWithBlock:^(NSArray *user_data, NSError *error) {
        self.user_data = user_data;
    
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
        });
    }];
}

#pragma mark -
#pragma mark TABLE

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.user_data == nil ? 1 : self.user_data.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    if (self.user_data) {
        MHHealthData *user_data = (MHHealthData*) [self.user_data objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:[NSString stringWithFormat:@"%@ - %@", user_data.field_name, user_data.value]];
    } else {
        [cell.textLabel setText:@"Loading..."];
    }
    
    
    return cell;
}

@end
