//
//  RCSceneFileManager.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreFileManager : NSObject
+ (NSString *)pathForKitName:(NSString *)kitName;
+ (NSString *)assetPathForKitName:(NSString *)kitName identifier:(NSString *)identifier;

+ (NSArray *)readSummaryData;
+ (BOOL)writeSummaryData:(NSArray *)summaries;
+ (NSDictionary *)readSubSummaryDataWithKitName:(NSString *)kitName;
+ (BOOL)writeSubSummaryData:(NSDictionary *)summary kitName:(NSString *)kitName;
+ (NSDictionary *)readKitData:(NSString *)kitName identifier:(NSString *)identifier;

+(BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;
@end

NS_ASSUME_NONNULL_END
