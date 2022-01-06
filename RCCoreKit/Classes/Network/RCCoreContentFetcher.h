//
//  RCKitContentFetcher.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreContentFetcher : NSObject
+ (void)fetchDataWithUrl:(NSString *)url
       completionHandler:(void(^ _Nullable)(NSURL * _Nullable fileUrl, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
