//
//  WDUtils.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDUtils.h"

static WDUtils *_sharedUtils = nil;

@implementation WDUtils

+ (WDUtils *)sharedUtils
{
    if (_sharedUtils == nil) {

        _sharedUtils = [[WDUtils alloc] init];
    }

    return _sharedUtils;
}

- (id)init
{
    self = [super init];
    if (self) {

        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }

    return self;
}

+ (NSDate *)dateFromString:(NSString *)string
{
    return [[WDUtils sharedUtils].dateFormatter dateFromString:string];
}

@end
