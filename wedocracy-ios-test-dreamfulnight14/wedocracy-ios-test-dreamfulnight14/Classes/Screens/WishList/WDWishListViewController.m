//
//  WDWishListViewController.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDWishListViewController.h"
#import "WDWishCell.h"
#import "WDWishDetailViewController.h"

@interface WDWishListViewController ()

@property (nonatomic, strong) NSMutableArray *wishes;

@end

@implementation WDWishListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [SVProgressHUD showWithStatus:@"Loading wishes..."];
    [WDApi getAllWishes:^(NSArray *wishes) {

        [SVProgressHUD dismiss];

        self.wishes = [NSMutableArray arrayWithArray:wishes];
        [self.tableView reloadData];
    } failure:^(NSString *error) {

        [SVProgressHUD showErrorWithStatus:error];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"wishDetail"]) {

        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

        WDWishDetailViewController *detailController = segue.destinationViewController;
        detailController.wish = self.wishes[indexPath.row];
    }
}

#pragma mark -
#pragma mark UITableViewDataSource, UITableViewDelegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.wishes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"wishCell";
    WDWishCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [cell setWish:self.wishes[indexPath.row]];

    return cell;
}

@end
