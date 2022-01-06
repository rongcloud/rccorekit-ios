//
//  RCDrawable.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCColor;
@class RCCorner;
@class RCDrawableValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCDrawable : RCConfigObject
@property (nonatomic, strong, readonly, nullable) RCDrawableValue *value;
@end

@interface RCDrawableValue : NSObject
@property (nonatomic, strong, nullable) NSNumber *shape;
@property (nonatomic, strong, nullable) NSNumber *strokeWidth;
@property (nonatomic, strong, nullable) RCColor *color;
@property (nonatomic, strong, nullable) RCColor *strokeColor;
@property (nonatomic, strong, nullable) RCCorner *corner;
@end

NS_ASSUME_NONNULL_END
