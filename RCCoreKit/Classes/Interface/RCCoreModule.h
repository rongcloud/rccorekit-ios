//
//  RCKitContent.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/6.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol RCCoreModule <NSObject>
@property (class, nonatomic, copy) NSString *assetsPath;
+ (void)loadData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
