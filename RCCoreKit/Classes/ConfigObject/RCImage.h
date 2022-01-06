//
//  RCImage.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCImageValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCImage : RCConfigObject
@property (nonatomic, strong, nullable) RCImageValue *value;
@end

@interface RCImageValue : NSObject
@property (nonatomic, copy, nullable) NSString *local;
@property (nonatomic, copy, nullable) NSString *remote;
//@property (nonatomic, copy, nullable) NSString *source;
@end

NS_ASSUME_NONNULL_END
