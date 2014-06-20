//
//  WDWishListViewController.h
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDWishListViewController : WDBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
