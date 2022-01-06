//
//  RCColor.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCColorValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCColor : RCConfigObject
@property (nonatomic, strong, nullable) RCColorValue *value;
@property (nonatomic, strong, nullable) UIColor *color;
@end

@interface RCColorValue : NSObject
@property (nonatomic, strong, nullable) NSNumber *red;
@property (nonatomic, strong, nullable) NSNumber *green;
@property (nonatomic, strong, nullable) NSNumber *blue;
@property (nonatomic, strong, nullable) NSNumber *alpha;
@property (nonatomic, strong, nullable) UIColor *color;
@end

NS_ASSUME_NONNULL_END
