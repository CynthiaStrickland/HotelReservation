//
//  LookUpViewController.m
//  HotelReservation
//
//  Created by Cynthia Whitlatch on 12/2/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "LookUpViewController.h"
#import "NSObject+NSmanagedObjectContext_Category.h"
#import "AppDelegate.h"
#import "Reservation.h"
#import "Guest.h"
#import "Room.h"
#import "Hotel.h"

@interface LookUpViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *dataSource;

@end

@implementation LookUpViewController

            //Overriding the Setter for the DataSource - As soon as Datasource is set reload TableView
- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    
    [self.tableView reloadData];
            //This reloads specific section of a TableView
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:(UITableViewRowAnimationAutomatic];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    bottom.active = YES;
}

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupLookupViewController];
}

- (void)setupLookupViewController {
    [self setTitle:@"Search"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Reservation *reservation = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Name: %@, Hotel: %@", reservation.guest.firstName, reservation.room.hotel.name];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 44.0)];
    searchBar.delegate = self;
    return searchBar;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    //Getting pointer to searchText, create a request for Reservation, set the Predicate to the name equal to the search text.  We are setting our DataSource to this result.   That is why we overrode the getter at the top of this class.
    NSString *searchText = searchBar.text;
    NSManagedObjectContext *context = [NSManagedObjectContext managerContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    request.predicate = [NSPredicate predicateWithFormat:@"guest.firstName == %@", searchText];

    NSError *error;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (!error) {
        self.dataSource = results;
    }
}

@end
