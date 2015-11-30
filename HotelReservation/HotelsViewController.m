//
//  HotelsViewController.m
//  HotelReservation
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "HotelsViewController.h"

@interface HotelsViewController () <UITableViewDataSource, UITextFieldDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSArray *hotels;

@end

@implementation HotelsViewController

-(void)loadView {
    UIView *rootView = [[UIView alloc] init];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
    self.tableView = tableView;
    [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
    [rootView addSubview:tableView];
    
    NSDictionary *views = @{@"tableView" : tableView};
    
    NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
    [rootView addConstraints:tableViewVerticalConstraints];
    NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
    [rootView addConstraints:tableViewHorizontalConstraints];
    
    self.view = rootView;
}

#pragma mark - TABLEVIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hotels.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}


@end
