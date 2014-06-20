//
//  WDWishCell.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDWishCell.h"
#import "WDApi.h"
#import "UIImageView+AFNetworking.h"

@implementation WDWishCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setWish:(WDWish *)wish
{
    [self.wishImageView setImage:nil];
    [self.wishImageView cancelImageRequestOperation];

    if ([wish.photo length] > 0) {

        [self.wishImageView setImageWithURL:[NSURL URLWithString:[IMAGE_BASEURL stringByAppendingString:wish.photo]]];
    }

    [self.lblGift setText:wish.gift];
    [self.lblIsCash setText:(wish.isCash == YES) ? @"Yes" : @"No"];
    [self.lblAmount setText:[NSString stringWithFormat:@"%.2f", wish.amount]];
    [self.lblStore setText:wish.store];
    [self.lblItemUrl setText:wish.item_url];
    [self.lblNotes setText:wish.notes];
}

@end
