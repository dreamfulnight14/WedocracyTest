//
//  WDApi.m
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "WDApi.h"

static WDApi *_api = nil;

@implementation WDApi

+ (WDApi *)sharedApi
{
    if (_api == nil) {

        _api = [[WDApi alloc] init];
    }

    return _api;
}

- (id)init
{
    self = [super init];
    if (self) {

        _httpClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:BASEURL]];
    }

    return self;
}

+ (void)getAllWishes:(void (^)(NSArray *wishes))success
             failure:(void (^)(NSString *error))failure
{
    NSString *path = @"request_index";
    NSDictionary *parameters = nil;
    NSURLRequest *request = [[WDApi sharedApi].httpClient requestWithMethod:@"GET" path:path parameters:parameters];
    AFHTTPRequestOperation *httpOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *resultArray = responseDict[@"wishes"];

        NSMutableArray *wishes = [NSMutableArray array];
        for (NSDictionary *dict in resultArray) {

            [wishes addObject:[WDWish wishObjectWithDictionary:dict]];
        }

        success(wishes);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error.description);
    }];

    [httpOperation start];
}

+ (void)deleteWish:(NSNumber *)wishId
           success:(void (^)())success
           failure:(void (^)(NSString *error))failure
{
    NSString *path = [NSString stringWithFormat:@"request_delete/%@", wishId];
    NSDictionary *parameters = nil;
    NSURLRequest *request = [[WDApi sharedApi].httpClient requestWithMethod:@"GET" path:path parameters:parameters];
    AFHTTPRequestOperation *httpOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        success();
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error.description);
    }];

    [httpOperation start];
}

+ (void)addOrEditWish:(BOOL)isEdit
               wishId:(NSNumber *)wishId
                 gift:(NSString *)gift
               isCash:(BOOL)isCash
               amount:(float)amount
                store:(NSString *)store
                photo:(NSString *)photo
             item_url:(NSString *)item_url
                notes:(NSString *)notes
              success:(void (^)())success
              failure:(void (^)(NSString *error))failure
{
    NSString *path = (isEdit == YES)    ? [NSString stringWithFormat:@"request_edit/%@", wishId]
                                        : [NSString stringWithFormat:@"request_add"];
    NSDictionary *parameters = @{@"gift": gift,
                                 @"is_cash": (isCash == YES) ? @"true" : @"false",
                                 @"amount": @(amount),
                                 @"store": store,
                                 @"photo": photo,
                                 @"item_url": item_url,
                                 @"notes": notes};
    NSURLRequest *request = [[WDApi sharedApi].httpClient requestWithMethod:@"POST" path:path parameters:parameters];
    AFHTTPRequestOperation *httpOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        success();
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error.description);
    }];

    [httpOperation start];
}

@end
