//
//  RCDrawableSelector.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCDrawableValue;
@class RCDrawableSelectorValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCDrawableSelector : RCConfigObject
@property (nonatomic, strong, nullable) RCDrawableSelectorValue *value;
@end

@interface RCDrawableSelectorValue : NSObject
@property (nonatomic, strong, nullable) RCDrawableValue *normal;
@property (nonatomic, strong, nullable) RCDrawableValue *select;
@end

NS_ASSUME_NONNULL_END
