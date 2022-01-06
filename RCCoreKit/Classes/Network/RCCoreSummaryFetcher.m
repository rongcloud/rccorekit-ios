//
//  RCCoreSummaryFetcher.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import "RCCoreSummaryFetcher.h"
#import "RCCoreConst.h"
#import "NSBundle+RCCore.h"
#import "RCCoreWebService.h"

@implementation RCCoreSummaryFetcher

+ (void)fetchDataWithUrl:(NSString *)url
       completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler {
    [self fetchDataWithUrl:url retryCount:kRetryCount completionHandler:completionHandler];
}

+ (void)fetchDataWithUrl:(NSString *)url
              retryCount:(NSInteger)retryCount
       completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler {
    [RCCoreWebService fetchDataWith:url completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (error && retryCount > 0) {
            [self fetchDataWithUrl:url retryCount:retryCount - 1 completionHandler:completionHandler];
        } else {
            if (completionHandler) {
                completionHandler(data,error);
            }
        }
    }];
}
@end
