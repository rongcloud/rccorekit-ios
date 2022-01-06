//
//  RCKitWebService.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/6.
//

#import "RCCoreWebService.h"
#import "RCCoreDownloadTaskReceiver.h"
#include "RCCoreConst.h"

@interface RCCoreWebService ()<NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate>
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;
@property (nonatomic, strong) NSMutableDictionary *taskReceiverTable;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;
@end

@implementation RCCoreWebService

#pragma mark - SHARE INSTANCE

+ (RCCoreWebService *)shareInstance {
    static dispatch_once_t onceToken;
    static RCCoreWebService *instance;
    dispatch_once(&onceToken, ^{
        instance = [[RCCoreWebService alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.lock = [[NSLock alloc] init];
        self.taskReceiverTable = [@{} mutableCopy];
    }
    return self;
}

+ (void)downloadWithUrl:(NSString *)url
  downloadFinishHandler:(void(^ _Nullable)(NSURL * _Nullable fileUrl, NSError * _Nullable error))downloadFinish {
    [[RCCoreWebService shareInstance] downloadWithUrl:url progress:nil downloadFinish:downloadFinish completionHandler:nil];
}

- (void)downloadWithUrl:(NSString *)url
               progress:(void (^ _Nullable)(NSProgress * _Nullable downloadProgress)) downloadProgressBlock
         downloadFinish:(void(^ _Nullable)(NSURL * _Nullable fileUrl, NSError * _Nullable error))downloadFinish
      completionHandler:(void (^ _Nullable)(NSURLResponse * _Nullable response, NSURL * _Nullable fileUrl, NSError * _Nullable error))completionHandler {
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:[NSURL URLWithString:url]];
    [self addReceiverForDownloadTask:task progress:downloadProgressBlock downloadFinish:downloadFinish completionHandler:completionHandler];
    [task resume];
}

+ (void)fetchDataWith:(NSString *)url
    completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler {
    [[RCCoreWebService shareInstance] fetchDataWith:url completionHandler:completionHandler];
}

- (void)fetchDataWith:(NSString *)url
    completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler {
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil && data.length > 0 && completionHandler != nil) {
            completionHandler(data,error);
        }
    }];
    [task resume];
}

- (NSURLSession *)session {
    if (_session == nil) {
        @synchronized (self) {
            _session = [NSURLSession sessionWithConfiguration:self.configuration delegate:self delegateQueue:self.queue];
        }
    }
    return _session;
}

- (NSURLSessionConfiguration *)configuration {
    return [NSURLSessionConfiguration defaultSessionConfiguration];
}

- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 1;
    }
    return _queue;
}

- (void)addReceiverForDownloadTask:(NSURLSessionDownloadTask *)downloadTask
                          progress:(void (^)(NSProgress * _Nullable downloadProgress)) downloadProgressBlock
                    downloadFinish:(void(^)(NSURL * _Nullable fileUrl, NSError * _Nullable error))downloadFinish
                 completionHandler:(void (^)(NSURLResponse * _Nullable response, NSURL * _Nullable fileUrl, NSError * _Nullable error))completionHandler {
    //添加代理回调监听的对象
    RCCoreDownloadTaskReceiver *receiver = [[RCCoreDownloadTaskReceiver alloc] init];
    receiver.downloadProgressBlock = downloadProgressBlock;
    receiver.completionHandler = completionHandler;
    receiver.downloadTaskDidFinishDownloading = downloadFinish;
    [self setReceiver:receiver forTask:downloadTask];
}

- (void)setReceiver:(RCCoreDownloadTaskReceiver *)receiver forTask:(NSURLSessionDownloadTask *)task {
    if (receiver == nil || task == nil) {
        return;
    }
    [self.lock lock];
    self.taskReceiverTable[@(task.taskIdentifier)] = receiver;
    [self.lock unlock];
}

- (nullable RCCoreDownloadTaskReceiver *)receiverForTask:(NSURLSessionTask *)task {
    if (task == nil) {
        return nil;
    }
    RCCoreDownloadTaskReceiver *delegate = nil;
    [self.lock lock];
    delegate = self.taskReceiverTable[@(task.taskIdentifier)];
    [self.lock unlock];

    return delegate;
}


#pragma mark - URL SESSION DELEGATE

- (void)URLSession:(__unused NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error {
    RCCoreDownloadTaskReceiver *receiver = [self receiverForTask:task];
    [receiver URLSession:session task:task didCompleteWithError:error];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    RCCoreDownloadTaskReceiver *receiver = [self receiverForTask:downloadTask];
    [receiver URLSession:session downloadTask:downloadTask didWriteData:bytesWritten totalBytesWritten:totalBytesWritten totalBytesExpectedToWrite:totalBytesExpectedToWrite];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes {
    RCCoreDownloadTaskReceiver *receiver = [self receiverForTask:downloadTask];
    [receiver URLSession:session downloadTask:downloadTask didResumeAtOffset:fileOffset expectedTotalBytes:expectedTotalBytes];
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    RCCoreDownloadTaskReceiver *receiver = [self receiverForTask:downloadTask];
    [receiver URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:location];
}
@end
