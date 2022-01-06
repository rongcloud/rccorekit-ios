//
//  RCFontSelector.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCFontValue;
@class RCFontSelectorValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCFontSelector : RCConfigObject
@property (nonatomic, strong, nullable) RCFontSelectorValue *value;
@end

@interface RCFontSelectorValue : NSObject
@property (nonatomic, strong) RCFontValue *normal;
@property (nonatomic, strong) RCFontValue *selected;
@end

NS_ASSUME_NONNULL_END
