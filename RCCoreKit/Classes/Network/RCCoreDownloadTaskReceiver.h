//
//  RCCoreDownloadTaskReceiver.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/06.
//

#import <Foundation/Foundation.h>

typedef void (^RCKitSessionDownloadTaskProgressBlock)(NSProgress * _Nullable progress);
typedef void (^RCKitSessionDownloadTaskDidFinishDownloadingBlock)(NSURL * _Nullable fileUrl, NSError * _Nullable error);
typedef void (^RCKitSessionTaskCompletionHandler)(NSURLResponse * _Nullable response, NSURL * _Nullable fileUrl, NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreDownloadTaskReceiver : NSObject <NSURLSessionTaskDelegate,NSURLSessionDataDelegate,NSURLSessionDownloadDelegate>
//进度回调
@property (nonatomic, copy, nullable) RCKitSessionDownloadTaskProgressBlock downloadProgressBlock;
//任务结束回调
@property (nonatomic, copy, nullable) RCKitSessionTaskCompletionHandler completionHandler;
//下载完成回调
@property (nonatomic, copy, nullable) RCKitSessionDownloadTaskDidFinishDownloadingBlock downloadTaskDidFinishDownloading;
@end

NS_ASSUME_NONNULL_END
