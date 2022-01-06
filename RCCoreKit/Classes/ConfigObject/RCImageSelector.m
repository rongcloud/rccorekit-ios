//
//  RCImageSelector.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCImageSelector.h"

@implementation RCImageSelector

- (NSDictionary<NSString *,NSString *> *)dictValue {
    
    NSMutableDictionary *mDict = [NSMutableDictionary new];
    
    NSString *normalLocal    = @"normal_local";
    NSString *normalRemote   = @"normal_remote";
    NSString *selectedLocal  = @"selected_local";
    NSString *selectedRemote = @"selected_remote";
    
    if (self.value.normal.local && self.value.normal.local.length > 0) {
        mDict[normalLocal] = self.value.normal.local;
    }
    if (self.value.normal.remote && self.value.normal.remote.length > 0) {
        mDict[normalRemote] = self.value.normal.remote;
    }
    if (self.value.select.local && self.value.select.local.length > 0 ) {
        mDict[selectedLocal] = self.value.select.local;
    }
    if (self.value.select.remote && self.value.select.remote.length > 0) {
        mDict[selectedRemote] = self.value.select.remote;
    }
    
    return [mDict copy];
}

@end

@implementation RCImageSelectorValue

@end

