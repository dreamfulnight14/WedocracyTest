//
//  WDWishDetailViewController.h
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDWishDetailViewController : WDBaseViewController

@property (nonatomic, strong) WDWish *wish;

@property (nonatomic, weak) IBOutlet UIImageView *wishImageView;
@property (nonatomic, weak) IBOutlet UILabel *lblGift;
@property (nonatomic, weak) IBOutlet UILabel *lblIsCash;
@property (nonatomic, weak) IBOutlet UILabel *lblAmount;
@property (nonatomic, weak) IBOutlet UILabel *lblStore;
@property (nonatomic, weak) IBOutlet UILabel *lblItemUrl;
@property (nonatomic, weak) IBOutlet UILabel *lblNotes;

- (IBAction)actionDelete;

@end
