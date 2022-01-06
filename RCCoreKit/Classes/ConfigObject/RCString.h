//
//  RCString.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"
NS_ASSUME_NONNULL_BEGIN

@interface RCString : RCConfigObject
@property (nonatomic, copy, nullable) NSString *value;
@end

NS_ASSUME_NONNULL_END
