//
//  RCSceneEngine.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/6.
//

#import <Foundation/Foundation.h>

typedef NSString *RCKitModuleNameKey NS_TYPED_EXTENSIBLE_ENUM;

FOUNDATION_EXPORT RCKitModuleNameKey const _Nonnull RCChatRoomKit;
FOUNDATION_EXPORT RCKitModuleNameKey const _Nonnull RCMusicControlKit;

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreEngine : NSObject
+ (void)initWithAppId:(NSString *)appId
                  key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
