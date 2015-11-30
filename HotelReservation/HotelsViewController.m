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
@property (strong,nonatomic) NSArray *dataSource;

@end

@implementation HotelsViewController

- (NSArray *)dataSource {
    if (!_dataSource) {
        AppDelegate * delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSManagedObjectContext *context = delegate.managedObjectContext;
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        NSError *fetchError;
        _dataSource = [context executeFetchRequest:request error:fetchError];
        
        if (fetchError) {
            NSLog(@"Error fetching from Core Data");
        }
        
    }
}
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

- (void)viewDidLoad {
    
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>]
}

#pragma mark - TABLEVIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    Hotel *hotel = self.dataSource[indexPath.row];
    cell.textLabel.text = hotel.name;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Hotel *hotel = self.dataSource[indexPath.row];
    RoomsViewController *roomsViewController = [[roomsViewController alloc]init];
    roomsViewController.hotel = hotel;
    [self.navigationController pushViewController:roomsViewController animated:Yes];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 150.0;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIImage *headerImage = [UIImage imageNamed:@" "];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:headerImage];
    imageView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 150.0);
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    return imageView;
}

@end
