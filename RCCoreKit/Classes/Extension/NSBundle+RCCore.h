//
//  NSBundle+RCCore.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Path)
+ (NSString *)rcc_pathForName:(NSString *)bundleName;
@end

NS_ASSUME_NONNULL_END
