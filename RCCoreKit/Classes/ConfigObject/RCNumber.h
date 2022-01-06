//
//  RCNumber.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCNumber : RCConfigObject
@property (nonatomic, strong, nullable) NSNumber *value;
@end

NS_ASSUME_NONNULL_END
