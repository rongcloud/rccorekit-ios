//
//  RCImage.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCImage.h"

@implementation RCImage

@end

@implementation RCImageValue
- (NSString *)source {
    if (self.remote) {
        return self.remote;
    }
    return self.local;
}
@end
