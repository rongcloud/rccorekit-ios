//
//  RCSceneEngine.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/6.
//

#import "RCCoreEngine.h"
#import "RCCoreConst.h"
#import "RCCoreModule.h"
#import "RCCoreSummaryFetcher.h"
#import "RCSummaryChecker.h"
#import "RCCoreWebService.h"
#import "NSBundle+RCCore.h"
#import "NSObject+YYModel.h"
#import "SSZipArchive.h"
#import "RCCoreContentFetcher.h"
#import "RCCoreFileManager.h"

RCKitModuleNameKey const RCChatRoomKit = @"ChatRoomKit";
RCKitModuleNameKey const RCMusicControlKit = @"MusicControlKit";

//模块名称和数据类型字符串映射关系
//SceneKit支持的模块都需要在此维护
static NSDictionary<RCKitModuleNameKey,NSString *>* subKitClassNameMap() {
    return @{
        RCMusicControlKit: @"RCMusicControlKitConfig",
    };
}

//子模块checker和子模块名字的映射关系
//SceneKit支持的模块都需要在此维护
static NSDictionary<RCKitModuleNameKey,NSString *>* subKitCheckerNameMap() {
    return @{
        RCMusicControlKit: @"RCCoreChecker",
    };
}

@interface RCCoreEngine ()
//初始化管道，读取本地json，
@property (nonatomic, strong) dispatch_queue_t pipeline;
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *key;
//摘要信息
@property (nonatomic, strong) RCSummaryChecker *checker;
//检测器
@property (nonatomic, copy) NSDictionary<RCKitModuleNameKey,RCCoreChecker *> *checkerMap;
@end

@implementation RCCoreEngine

- (instancetype)init {
    if (self = [super init]) {
        self.pipeline = dispatch_queue_create("rc_kit_serial_queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

+ (RCCoreEngine *)shareInstance {
    static RCCoreEngine *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RCCoreEngine alloc] init];
    });
    return instance;
}

+ (void)initWithAppId:(NSString *)appId
                  key:(NSString *)key {
    [[self shareInstance] initWithAppId:appId key:key];
}

- (void)initWithAppId:(NSString *)appId key:(NSString *)key {
    self.appId = appId;
    self.key = key;
    NSAssert(appId != nil && key != nil, @"参数错误");
    dispatch_sync(self.pipeline, ^{
        //下载远程配置摘要
        [self fetchSummary];
        
        //读取本地配置摘要
        NSArray *summaries = [self readLocalSummaries];
        
        //配置checker
        self.checkerMap = [self configCheckers:summaries];
        
        //配置子模块
        [self configSubKits:summaries checkerMap:self.checkerMap];
    });
}


- (void)fetchSummary {
    [RCCoreSummaryFetcher fetchDataWithUrl:@"" completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
        NSArray *datas = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        BOOL success = [self.checker check:data];
        if (success && datas != nil && datas.count > 0) {
            success = [RCCoreFileManager writeSummaryData:datas];
            if (success) {
                NSArray *sms = [self readSummary:datas];
                if (sms == nil || sms.count == 0) return;
                if (self.checkerMap == nil || self.checkerMap.allKeys.count == 0) {
                    self.checkerMap = [self configCheckers:sms];
                } else {
                    for (RCCoreSummary *obj in sms) {
                        RCCoreChecker *checker = self.checkerMap[obj.name];
                        if (checker) {
                            checker.summary = obj;
                        }
                    }
                }
                [self downloadKits:self.checkerMap];
            } else {
                NSLog(@"本地写入摘要信息失败");
            }
        } else {
            NSLog(@"摘要数据检测不通过，摘要内注册的模块信息不完整");
        }
    }];
}

//读取配置 同时更新checker summary
- (nullable NSArray<RCCoreSummary *> *)readSummary:(NSArray *)datas {
    if (datas != nil && datas.count) {
        NSMutableArray *res = [@[] mutableCopy];
        for (NSDictionary *value in datas) {
            RCCoreSummary *summary = [RCCoreSummary yy_modelWithDictionary:value];
            if (summary) {
                [res addObject:summary];
            }
        }
        return [res copy];
    } else {
        NSLog(@"本地没有摘要文件");
    }
    return nil;
}

- (nullable NSArray<RCCoreSummary *> *)readLocalSummaries {
    NSArray *datas = [RCCoreFileManager readSummaryData];
    return [self readSummary:datas];
}

- (void)downloadKit:(RCCoreChecker *)checker {
    NSString *url = checker.summary.url;
    [RCCoreContentFetcher fetchDataWithUrl:url completionHandler:^(NSURL * _Nullable fileUrl, NSError * _Nullable error) {
        NSData *data = [NSData dataWithContentsOfURL:fileUrl];
        BOOL success = [checker check:data];
        if (success) {
            dispatch_sync(self.pipeline, ^{
                //解压
                NSString *subKitPath = [RCCoreFileManager pathForKitName:checker.summary.name];
                BOOL res = [SSZipArchive unzipFileAtPath:fileUrl.relativePath toDestination:subKitPath];
                //解压成功
                if (res) {
                    //更新子模块摘要信息
                    NSDictionary *summaryDict = (NSDictionary *)[checker.summary yy_modelToJSONObject];
                    res = [RCCoreFileManager writeSubSummaryData:summaryDict kitName:checker.summary.name];
                    //更新成功
                    if (!res) {
                        NSLog(@"%@ 子模块摘要信息写入失败",checker.summary.name);
                    }
                } else {
                    NSLog(@"%@ 子模块配置数据解压失败",checker.summary.name);
                }
            });
        }
    }];
}

- (void)downloadKits:(NSDictionary<RCKitModuleNameKey,RCCoreChecker *> *)checkerMap {
    for (RCCoreChecker *checker in [checkerMap allValues]) {
        if (checker.needUpdate) {
            [self downloadKit:checker];
        }
    }
}

- (void)assignConfiguration:(NSDictionary **)configPath assetPath:(NSString **)assetPath summary:(RCCoreSummary *)summary {
    *configPath = [RCCoreFileManager readKitData:summary.name identifier:summary.kitId];
    *assetPath = [RCCoreFileManager assetPathForKitName:summary.name identifier:summary.kitId];
}

- (void)configKitWithName:(RCKitModuleNameKey)name checkerMap:(NSDictionary<RCKitModuleNameKey,RCCoreChecker *> *)checkerMap {
    RCCoreChecker *checker = checkerMap[name];
    RCCoreSummary *summary = checker.summary;
    if (checker) {
        NSDictionary *configDict;
        NSString *assetsPath;
        [self assignConfiguration:&configDict assetPath:&assetsPath summary:summary];
        //如果根据摘要信息找不到配置文件
        if (!(assetsPath && configDict)) {
            summary = [RCCoreSummary yy_modelWithDictionary:[RCCoreFileManager readSubSummaryDataWithKitName:summary.name]];
            if (summary) {
                [self assignConfiguration:&configDict assetPath:&assetsPath summary:summary];
            } else {
                NSLog(@"%@ 子模块摘要文件缺失",name);
                return;
            }
        }
        if (!(assetsPath && configDict)) {
            NSLog(@"%@ 配置文件缺失",name);
            return;
        }
        NSString *className = subKitClassNameMap()[name];
        Class class = NSClassFromString(className);
        if ([class conformsToProtocol:@protocol(RCCoreModule)]) {
            if (configDict) {
                [class performSelector:@selector(loadData:) withObject:configDict];
                [class performSelector:@selector(setAssetsPath:) withObject:assetsPath];
            } else {
                NSAssert(NO, @"%@ 配置数据为空", name);
            }
        } else {
            NSAssert(NO, @"%@ 没有实现RCKitModule协议",className);
        }
    } else {
        NSLog(@"checker 加载失败，请注册 %@ 模块的 checker",name);
    }
}

- (void)configSubKits:(NSArray<RCCoreSummary *> *)summaries checkerMap:(NSDictionary<RCKitModuleNameKey,RCCoreChecker *> *)checkerMap {
    for (RCCoreSummary *summary in summaries) {
        [self configKitWithName:summary.name checkerMap:checkerMap];
    }
}

- (NSDictionary<RCKitModuleNameKey,RCCoreChecker *> *)configCheckers:(NSArray<RCCoreSummary *> *)summaries {
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (RCCoreSummary *summary in summaries) {
        NSString *className = subKitCheckerNameMap()[summary.name];
        if (className == nil || className.length == 0) {
            NSLog(@"无效模块：%@",summary.name);
            continue;
        }
        
        Class class = NSClassFromString(className);
        if (class == nil) {
            NSLog(@"当前类不存在：%@",className);
            continue;
        }
        
        RCCoreChecker *checker = [[class alloc] init];
        checker.summary = summary;
        if (checker) {
            result[summary.name] = checker;
        } else {
            NSLog(@"%@模块 checker 初始化失败",summary.name);
        }
    }
    return [result copy];
}

- (RCSummaryChecker *)checker {
    if (_checker == nil) {
        _checker = [[RCSummaryChecker alloc] init];
    }
    return _checker;
}
@end
