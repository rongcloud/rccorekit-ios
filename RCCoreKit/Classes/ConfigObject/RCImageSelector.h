//
//  RCImageSelector.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCImageValue;
@class RCImageSelectorValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCImageSelector : RCConfigObject
@property (nonatomic, strong, nullable) RCImageSelectorValue *value;
@property (nonatomic, copy, nullable) NSDictionary<NSString*,NSString*> *dictValue;
@end

@interface RCImageSelectorValue : NSObject
@property (nonatomic, strong) RCImageValue *normal;
@property (nonatomic, strong) RCImageValue *select;
@end

NS_ASSUME_NONNULL_END
