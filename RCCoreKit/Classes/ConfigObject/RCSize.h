//
//  RCSize.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCSizeValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCSize : RCConfigObject
@property (nonatomic, strong, nullable) RCSizeValue *value;
@property (nonatomic, assign) CGSize size;
@end


@interface RCSizeValue : NSObject
@property (nonatomic, strong, nullable) NSNumber *width;
@property (nonatomic, strong, nullable) NSNumber *height;
@property (nonatomic, strong, nullable) NSNumber *widthMode;
@property (nonatomic, strong, nullable) NSNumber *heightMode;
@property (nonatomic, assign) CGSize size;
@end


NS_ASSUME_NONNULL_END
