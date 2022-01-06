//
//  RCConfigObject.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/21.
//

#import <Foundation/Foundation.h>
#import "RCCoreConst.h"
#import <YYModel/NSObject+YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCConfigObject : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@end

NS_ASSUME_NONNULL_END
