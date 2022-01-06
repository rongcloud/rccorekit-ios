//
//  RCCoreSummary.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface RCCoreSummary : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *kitId;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *md5;
@property (nonatomic, strong) NSNumber *updateTime;
@end
NS_ASSUME_NONNULL_END
