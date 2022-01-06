//
//  RCInsets.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCInsetsValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCInsets : RCConfigObject
@property (nonatomic, strong, nullable) RCInsetsValue *value;
@property (nonatomic, assign) UIEdgeInsets insets;
@end

@interface RCInsetsValue : NSObject
@property (nonatomic, strong, nullable) NSNumber *top;
@property (nonatomic, strong, nullable) NSNumber *left;
@property (nonatomic, strong, nullable) NSNumber *bottom;
@property (nonatomic, strong, nullable) NSNumber *right;
@property (nonatomic, assign) UIEdgeInsets insets;
@end

NS_ASSUME_NONNULL_END
