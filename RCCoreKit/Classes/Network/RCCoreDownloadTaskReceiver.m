//
//  RCKitDownloadTaskReceiver.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/06.
//

#import "RCCoreDownloadTaskReceiver.h"

@interface RCCoreDownloadTaskReceiver ()
@property (nonatomic, strong) NSProgress *downloadProgress;
@property (nonatomic, copy) NSURL *fileUrl;
@end

@implementation RCCoreDownloadTaskReceiver

- (void)dealloc {
    [self.downloadProgress removeObserver:self forKeyPath:NSStringFromSelector(@selector(fractionCompleted))];
}

- (instancetype)init {
    if (self = [super init]) {
        //监听下载进度
        self.downloadProgress = [[NSProgress alloc] initWithParent:nil userInfo:nil];
        self.downloadProgress.totalUnitCount = NSURLSessionTransferSizeUnknown;
        [self.downloadProgress addObserver:self
                   forKeyPath:NSStringFromSelector(@selector(fractionCompleted))
                      options:NSKeyValueObservingOptionNew
                      context:NULL];
    }
    return self;
}

#pragma mark OBSERVER
//监听下载进度
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
   if ([object isEqual:self.downloadProgress]) {
        if (self.downloadProgressBlock) {
            self.downloadProgressBlock(object);
        }
    }
}

#pragma mark - SESSION DELEGATE

- (void)URLSession:(__unused NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error {
    if (self.completionHandler) {
        self.completionHandler(task.response, self.fileUrl, error);
    }
    if (self.downloadTaskDidFinishDownloading && error) {
        self.downloadTaskDidFinishDownloading(nil, error);
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    self.downloadProgress.totalUnitCount = totalBytesExpectedToWrite;
    self.downloadProgress.completedUnitCount = totalBytesWritten;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes{
    self.downloadProgress.totalUnitCount = expectedTotalBytes;
    self.downloadProgress.completedUnitCount = fileOffset;
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    self.fileUrl = location;
    if (self.downloadTaskDidFinishDownloading) {
        self.downloadTaskDidFinishDownloading(self.fileUrl, nil);
    }
}

#pragma mark - GETTER

- (NSProgress *)downloadProgress {
    if (_downloadProgress == nil) {
        _downloadProgress = [[NSProgress alloc] initWithParent:nil userInfo:nil];
    }
    return _downloadProgress;
}

@end
