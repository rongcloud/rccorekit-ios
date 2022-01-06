//
//  RCKitContentFetcher.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import "RCCoreContentFetcher.h"
#import "RCCoreWebService.h"
#import "RCCoreConst.h"
#import "NSBundle+RCCore.h"

@implementation RCCoreContentFetcher
+ (void)fetchDataWithUrl:(NSString *)url
       completionHandler:(void(^ _Nullable)(NSURL * _Nullable fileUrl, NSError * _Nullable error))completionHandler {
    [self fetchDataWithUrl:url retryCount:kRetryCount completionHandler:completionHandler];
}

+ (void)fetchDataWithUrl:(NSString *)url
              retryCount:(NSInteger)retryCount
       completionHandler:(void(^ _Nullable)(NSURL * _Nullable fileUrl, NSError * _Nullable error))completionHandler {
    [RCCoreWebService downloadWithUrl:url downloadFinishHandler:^(NSURL * _Nullable fileUrl, NSError * _Nullable error) {
        if (error && retryCount > 0) {
            [self fetchDataWithUrl:url retryCount:retryCount - 1 completionHandler:completionHandler];
        } else {
            if (completionHandler) {
                completionHandler(fileUrl,error);
            }
        }
    }];
}
@end
