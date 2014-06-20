//
//  WDUtils.h
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

@interface WDUtils : NSObject

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

+ (WDUtils *)sharedUtils;

+ (NSDate *)dateFromString:(NSString *)string;

@end
