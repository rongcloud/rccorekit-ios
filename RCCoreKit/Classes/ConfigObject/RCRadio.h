//
//  RCRadio.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

NS_ASSUME_NONNULL_BEGIN

@class RCNumber;
@class RCRadioValue;

@interface RCRadio : RCConfigObject
@property (nonatomic, strong, nullable) RCRadioValue *value;
@end

@interface RCRadioValue : NSObject
@property (nonatomic, copy, nullable) NSArray<RCNumber *>* radios;
@property (nonatomic, strong, nullable) RCNumber* select;
@end

NS_ASSUME_NONNULL_END
