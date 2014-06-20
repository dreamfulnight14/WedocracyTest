//
//  WDWish.h
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

@interface WDWish : NSObject

@property (nonatomic, strong, readonly) NSNumber *wishId;
@property (nonatomic, strong) NSString *gift;
@property (nonatomic) BOOL isCash;
@property (nonatomic) float amount;
@property (nonatomic, strong) NSString *store;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *item_url;
@property (nonatomic, strong) NSString *notes;

@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSDate *modifiedDate;

+ (WDWish *)wishObjectWithDictionary:(NSDictionary *)dict;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
