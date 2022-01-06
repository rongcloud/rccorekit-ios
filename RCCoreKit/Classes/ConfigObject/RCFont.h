//
//  RCFont.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCFontValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCFont : RCConfigObject
@property (nonatomic, strong, nullable) RCFontValue *value;
@property (nonatomic, strong, nullable) UIFont *font;
@end

@interface RCFontValue : NSObject
@property (nonatomic, strong, nullable) NSNumber *size;
@property (nonatomic, strong, nullable) NSNumber *weight;
@property (nonatomic, strong, nullable) UIFont *font;
@end
NS_ASSUME_NONNULL_END
