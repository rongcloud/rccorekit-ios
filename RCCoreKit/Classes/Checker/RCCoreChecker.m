//
//  RCKitChecker.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import "RCCoreChecker.h"
#import "NSData+RCCore.h"

@interface RCCoreChecker ()
@property (nonatomic, assign, readwrite) BOOL needUpdate;
@end

@implementation RCCoreChecker

- (BOOL)check:(NSData *)data {
    if (data == nil) {
        NSLog(@"check 对象为 nil");
        return NO;
    }
    if (self.summary == nil) return NO;
    
    NSString *md5 = [data rcc_md5];
    return [md5 isEqualToString:self.summary.md5];
}

- (void)setSummary:(RCCoreSummary *)summary {
    _needUpdate = ![_summary.kitId isEqualToString:summary.kitId];
    _summary = summary;
}
@end
