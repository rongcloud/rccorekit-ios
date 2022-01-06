//
//  RCSceneFileManager.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/28.
//

#import "RCCoreFileManager.h"
#import "FCFileManager.h"
#import "RCCoreConst.h"

@implementation RCCoreFileManager

#pragma mark - Path

+(NSString *)rootPath {
    return [FCFileManager pathForDocumentsDirectoryWithPath:kBundleName];
}

+(NSString *)summaryPath {
    NSString *res;
    NSString *rootPath = [self rootPath];
    if (rootPath) {
        res = [rootPath stringByAppendingPathComponent:kSummary];
    }
    return res;
}

+ (NSString *)pathForKitName:(NSString *)kitName {
    NSString *rootPath = [self rootPath];
    NSString *kitPath = [rootPath stringByAppendingPathComponent:kitName];
    if ([FCFileManager existsItemAtPath:kitPath]) {
        return kitPath;
    } else {
        BOOL res = [FCFileManager createDirectoriesForPath:kitPath];
        if (!res) {
            return nil;
        }
    }
    return kitPath;
}

+ (NSString *)assetPathForKitName:(NSString *)kitName identifier:(NSString *)identifier {
    NSString *kitPath = [self pathForKitName:kitName];
    NSString *res;
    res = [kitPath stringByAppendingPathComponent:identifier];
    if (![FCFileManager existsItemAtPath:res]) {
        return nil;
    }
    res = [res stringByAppendingPathComponent:kAssets];
    return res;
}

#pragma mark - Data

+(BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error {
    return [FCFileManager writeFileAtPath:path content:content error:error];
}

+ (NSArray *)readSummaryData {
    return [[NSArray alloc] initWithContentsOfFile:[self summaryPath]];
}

+ (BOOL)writeSummaryData:(NSArray *)summaries {
    NSString *summaryPath = [self summaryPath];
    return [self writeFileAtPath:summaryPath content:summaries error:nil];
}

+ (NSDictionary *)readSubSummaryDataWithKitName:(NSString *)kitName {
    NSString *kitPath = [self pathForKitName:kitName];
    NSString *configPath = [kitPath stringByAppendingPathComponent:kitName];
    return [[NSDictionary alloc] initWithContentsOfFile:configPath];
}

+ (BOOL)writeSubSummaryData:(NSDictionary *)summary kitName:(NSString *)kitName {
    if (summary == nil) return NO;
    NSString *kitPath = [self pathForKitName:kitName];
    NSString *configPath = [kitPath stringByAppendingPathComponent:kitName];
    return [self writeFileAtPath:configPath content:summary error:nil];
}

+ (NSDictionary *)readKitData:(NSString *)kitName identifier:(NSString *)identifier {
    if (identifier == nil || kitName == nil || identifier.length == 0 || kitName.length == 0) {
        NSLog(@"readKitData 无效参数");
        return nil;
    }
    NSString *kitPath = [self pathForKitName:kitName];
    NSString *identifierPath = [kitPath stringByAppendingPathComponent:identifier];
    NSString *configPath = [identifierPath stringByAppendingPathComponent:kConfigJson];
    if (![FCFileManager existsItemAtPath:configPath]) {
        NSLog(@"readKitData 文件不存在");
        return nil;
    }
    NSData *data = [NSData dataWithContentsOfFile:configPath];
    if (data == nil) {
        NSLog(@"readKitData data 为空");
        return nil;
    }
    NSDictionary *configDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return configDict;
}

@end
