//
//  RCKitChecker.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import <Foundation/Foundation.h>
#import "RCCoreSummary.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreChecker : NSObject
//子模块摘要信息
@property (nonatomic, strong) RCCoreSummary *summary;
//是否需要更新
@property (nonatomic, assign, readonly) BOOL needUpdate;
//该方法提供数据一致性校验，检测过程中如果包含其他校验请实现RCKitChecker子类并重载该方法
- (BOOL)check:(nullable NSData *)data;
@end

NS_ASSUME_NONNULL_END
