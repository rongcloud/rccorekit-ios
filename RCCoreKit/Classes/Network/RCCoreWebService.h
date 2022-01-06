//
//  RCCoreWebService.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreWebService : NSObject

+ (void)downloadWithUrl:(NSString *)url
  downloadFinishHandler:(void(^ _Nullable)(NSURL * _Nullable fileUrl, NSError * _Nullable error))downloadFinish;

+ (void)fetchDataWith:(NSString *)url
    completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
