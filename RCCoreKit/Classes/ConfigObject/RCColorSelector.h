//
//  RCColorSelector.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCColorValue;
@class RCColorSelectorValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCColorSelector : RCConfigObject
@property (nonatomic, strong, nullable) RCColorSelectorValue *value;
@end

@interface RCColorSelectorValue : NSObject
@property (nonatomic, strong, nullable) RCColorValue *normal;
@property (nonatomic, strong, nullable) RCColorValue *select;
@end
NS_ASSUME_NONNULL_END
