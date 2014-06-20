//
//  WDEditWishViewController.h
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDEditWishViewController : WDBaseViewController <UITextFieldDelegate>

@property (nonatomic, strong) WDWish *wish;

@property (nonatomic, weak) IBOutlet UIImageView *wishImageView;
@property (nonatomic, weak) IBOutlet UITextField *tfGift;
@property (nonatomic, weak) IBOutlet UISwitch *cashSwitch;
@property (nonatomic, weak) IBOutlet UITextField *tfAmount;
@property (nonatomic, weak) IBOutlet UITextField *tfStore;
@property (nonatomic, weak) IBOutlet UITextField *tfItemUrl;
@property (nonatomic, weak) IBOutlet UITextField *tfNotes;

- (IBAction)actionChooseImage;

@end
