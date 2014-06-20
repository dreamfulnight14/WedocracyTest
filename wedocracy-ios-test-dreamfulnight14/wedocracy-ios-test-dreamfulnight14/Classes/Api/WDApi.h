//
//  WDApi.h
//  wedocracy-ios-test-dreamfulnight14
//
//  Created by MacOs on 6/20/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "AFNetworking.h"
#import "WDWish.h"

#define BASEURL @"http://wedocracy-ios-test.herokuapp.com/client/"

#define IMAGE_BASEURL @"http://res.cloudinary.com/hew6ktdno/image/upload/c_fill,h_60,w_60/"

@interface WDApi : NSObject

@property (nonatomic, readonly) AFHTTPClient *httpClient;

+ (WDApi *)sharedApi;

+ (void)getAllWishes:(void (^)(NSArray *wishes))success
             failure:(void (^)(NSString *error))failure;

+ (void)deleteWish:(NSNumber *)wishId
           success:(void (^)())success
           failure:(void (^)(NSString *error))failure;

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
              failure:(void (^)(NSString *error))failure;

@end
