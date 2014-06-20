//
//  WDWish.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDWish.h"

@implementation WDWish

+ (WDWish *)wishObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {

        NSMutableDictionary *wishDict = [NSMutableDictionary dictionaryWithDictionary:dict[@"Wish"]];
        for (NSString *key in [wishDict allKeys]) {

            // remove all null values
            if ([wishDict[key] isKindOfClass:[NSNull class]]) {

                [wishDict removeObjectForKey:key];
            }
        }

        _wishId = wishDict[@"id"];
        self.gift = wishDict[@"gift"];
        self.isCash = [wishDict[@"is_cash"] boolValue];
        self.amount = [wishDict[@"amount"] floatValue];
        self.store = wishDict[@"store"];
        self.photo = wishDict[@"photo"];
        self.item_url = wishDict[@"item_url"];
        self.notes = wishDict[@"notes"];

        self.createdDate = [WDUtils dateFromString:wishDict[@"created"]];
        self.modifiedDate = [WDUtils dateFromString:wishDict[@"modified"]];
    }

    return self;
}

@end
