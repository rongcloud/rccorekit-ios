//
//  RCString.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCString.h"

@implementation RCString
- (NSString *)string {
    NSString *string = (NSString *)self.value;
    if (string == nil) {
        NSAssert(NO, @"RCString parse fail");
    }
    return string;
}
@end
