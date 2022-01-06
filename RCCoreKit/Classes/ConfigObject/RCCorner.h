//
//  RCCorner.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCCornerValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCCorner : RCConfigObject
@property (nonatomic, strong, nullable) RCCornerValue *value;
@property (nonatomic, assign) CGFloat radius;
- (UIEdgeInsets)corner;
@end

@interface RCCornerValue : NSObject
@property (nonatomic, strong, nullable) NSNumber *topLeft;
@property (nonatomic, strong, nullable) NSNumber *topRight;
@property (nonatomic, strong, nullable) NSNumber *bottomLeft;
@property (nonatomic, strong, nullable) NSNumber *bottomRight;
@end

NS_ASSUME_NONNULL_END
