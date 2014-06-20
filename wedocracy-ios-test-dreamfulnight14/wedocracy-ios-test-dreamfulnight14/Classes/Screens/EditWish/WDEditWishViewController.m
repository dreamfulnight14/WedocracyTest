//
//  WDEditWishViewController.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDEditWishViewController.h"

@interface WDEditWishViewController ()

@property (nonatomic, strong) UIImage *chosenImage;

@end

@implementation WDEditWishViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self applyWishToViews];
}

- (void)applyWishToViews
{
    [self.wishImageView setImage:nil];
    [self.wishImageView cancelImageRequestOperation];

    if ([self.wish.photo length] > 0) {

        [self.wishImageView setImageWithURL:[NSURL URLWithString:[IMAGE_BASEURL stringByAppendingString:self.wish.photo]]];
    }

    [self.tfGift setText:self.wish.gift];
    [self.cashSwitch setOn:self.wish.isCash];
    [self.tfAmount setText:[NSString stringWithFormat:@"%.2f", self.wish.amount]];
    [self.tfStore setText:self.wish.store];
    [self.tfItemUrl setText:self.wish.item_url];
    [self.tfNotes setText:self.wish.notes];
}

- (void)setupNavigationBar
{
    NSString *btnTitle = (self.wish == nil) ? @"Add" : @"Edit";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:btnTitle style:UIBarButtonItemStylePlain target:self action:@selector(onPressRightNavigationItem)];

    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

- (void)onPressLeftNavigationItem
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)onPressRightNavigationItem
{
    BOOL bEdit = (self.wish != nil);
    NSString *status = (bEdit == YES) ? @"Editing wish..." : @"Adding wish...";

    [SVProgressHUD showWithStatus:status];
    [WDApi addOrEditWish:bEdit
                  wishId:self.wish.wishId
                    gift:(self.tfGift.text == nil) ? @"" : self.tfGift.text
                  isCash:self.cashSwitch.on
                  amount:[self.tfAmount.text floatValue]
                   store:(self.tfStore.text == nil) ? @"" : self.tfStore.text
                   photo:(self.wish.photo == nil) ? @"" : self.wish.photo
                item_url:(self.tfItemUrl.text == nil) ? @"" : self.tfItemUrl.text
                   notes:(self.tfNotes.text == nil) ? @"" : self.tfNotes.text
                 success:^{

                     [SVProgressHUD dismiss];
    } failure:^(NSString *error) {

        [SVProgressHUD showErrorWithStatus:error];
    }];
}

- (void)actionChooseImage
{
    //
}

#pragma mark -
#pragma mark UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
