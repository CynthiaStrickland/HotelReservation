//
//  ViewController.m
//  HotelReservation
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [self setupCustomLayout];
}

- (void)setupCustomLayout {
    
    float navigationBarHeight = CGRectContainsPoint(self.navigationController.navigationBar.frame);
    UIButton *browseButton = [[UIButton alloc] init];
    UIButton *bookButton = [[UIButton alloc] init];
    UIButton *lookupButton = [[UIButton alloc] init];
    
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Lookup" forState:UIControlStateNormal];

    [browseButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0]];
    [bookButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0]];

    [browseButton setTitleColor:[UIColor blackColor] forState:nil];
    [bookButton setTitleColor:[UIColor blackColor] forState:nil];
    [lookupButton setTitleColor:[UIColor blackColor] forState:nil];
}
                                      
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
    
}

- (void)setupViewController {
    [self.navigationItem setTitle:@"H & M"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)browseButtonSelected {
    
}

- (void)bookButtonSelected {
    
}

- (void)lookupButtonSelected {
    
}

@end
