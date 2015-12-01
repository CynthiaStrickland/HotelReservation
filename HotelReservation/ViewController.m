//
//  ViewController.m
//  HotelReservation
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"
#import "RoomsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    [self setupCustomLayout];
}

- (void)setupCustomLayout {
    
    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
            //INITIALIZE THREE BUTTONS
    UIButton *browseButton = [[UIButton alloc] init];
    UIButton *bookButton = [[UIButton alloc] init];
    UIButton *lookupButton = [[UIButton alloc] init];
    
            //SET BUTTON TITLES
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Lookup" forState:UIControlStateNormal];
    
            //SET BUTTON BACKGROUND COLORS
    [browseButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0]];
    [bookButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0]];

            //SET BUTTON TITLE COLORS
    [browseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lookupButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
            //BROWSE BUTTON CONSTRAINTS
    NSLayoutConstraint *browseButtonLeading = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *browseButtonTrailing = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *browseButtonTop = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:64.0];
    
            //BOOK BUTTON CONSTRAINTS
    NSLayoutConstraint *bookButtonLeading = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookButtonCenterY = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:navigationBarHeight / 1.4];
    
    NSLayoutConstraint *bookButtonTrailing = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
            //LOOKUP BUTTON CONSTRAINTS
    NSLayoutConstraint *lookupButtonLeading = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookupButtonTrailing = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookupButtonBottom = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
            //BUTTON HEIGHT
    NSLayoutConstraint *browseButtonHeight = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bookButtonHeight = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0.0];
    NSLayoutConstraint *lookupButtonHeight = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    [self.view addSubview:browseButton];
    [self.view addSubview:bookButton];
    [self.view addSubview:lookupButton];
    
        //Activate Constraints
    browseButtonLeading.active = YES;
    browseButtonTrailing.active = YES;
    browseButtonTop.active = YES;
    
    bookButtonLeading.active = YES;
    bookButtonTrailing.active = YES;
    bookButtonCenterY.active = YES;
    
    lookupButtonLeading.active = YES;
    lookupButtonTrailing.active = YES;
    lookupButtonBottom.active = YES;
    
    browseButtonHeight.active = YES;
    bookButtonHeight.active = YES;
    lookupButtonHeight.active = YES;
    
            //SETUP ACTIONS
    
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
}
        //SELECTORS FOR BUTTONS

- (void)browseButtonSelected:(UIButton *)sender {
    HotelsViewController *hotelsViewController = [[HotelsViewController alloc]init];
    [self.navigationController pushViewController:hotelsViewController animated:YES];
}

- (void)bookButtonSelected:(UIButton *)sender {
    DatePickerViewController *datePickerViewController = [[DatePickerViewController alloc]init];
    [self.navigationController pushViewController:datePickerViewController animated:YES];
}
- (void)lookupButtonSelected:(UIButton *)sender {
    RoomsViewController *roomsViewController = [[RoomsViewController alloc]init];
    [self.navigationController pushViewController:roomsViewController animated:YES];
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

@end
