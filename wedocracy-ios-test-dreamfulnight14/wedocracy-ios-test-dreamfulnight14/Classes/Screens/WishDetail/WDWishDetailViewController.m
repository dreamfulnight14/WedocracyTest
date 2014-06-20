//
//  WDWishDetailViewController.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDWishDetailViewController.h"
#import "WDEditWishViewController.h"

@interface WDWishDetailViewController ()

@end

@implementation WDWishDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self applyWishToViews];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editWish"]) {

        UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        WDEditWishViewController *editController = (WDEditWishViewController *)navigationController.topViewController;
        editController.wish = self.wish;
    }
}

- (void)applyWishToViews
{
    [self.wishImageView setImage:nil];
    [self.wishImageView cancelImageRequestOperation];

    if ([self.wish.photo length] > 0) {

        [self.wishImageView setImageWithURL:[NSURL URLWithString:[IMAGE_BASEURL stringByAppendingString:self.wish.photo]]];
    }

    [self.lblGift setText:self.wish.gift];
    [self.lblIsCash setText:(self.wish.isCash == YES) ? @"Yes" : @"No"];
    [self.lblAmount setText:[NSString stringWithFormat:@"%.2f", self.wish.amount]];
    [self.lblStore setText:self.wish.store];
    [self.lblItemUrl setText:self.wish.item_url];
    [self.lblNotes setText:self.wish.notes];
}

- (void)actionDelete
{
    [SVProgressHUD showWithStatus:@"Deleting wish..."];
    [WDApi deleteWish:self.wish.wishId success:^{

        [SVProgressHUD dismiss];

        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSString *error) {

        [SVProgressHUD showErrorWithStatus:error];
    }];
}

@end
