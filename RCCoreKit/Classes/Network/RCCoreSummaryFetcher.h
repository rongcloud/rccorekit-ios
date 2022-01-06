//
//  RCCoreSummaryFetcher.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreSummaryFetcher : NSObject
+ (void)fetchDataWithUrl:(NSString *)url completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
