//
//  RCSize.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCSize.h"

@implementation RCSize
- (CGSize)size {
    
    return self.value.size;
}
@end

@implementation RCSizeValue
- (CGSize)size {
    NSNumber *width = self.width;
    NSNumber *height = self.height;
    NSNumber *widthMode = self.widthMode;
    NSNumber *heightMode = self.heightMode;
    
    if (!(width && height && widthMode && heightMode)) {
        NSLog(@"RCSize 数据错误");
        return CGSizeZero;
    }
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;

    CGFloat w = width.doubleValue;
    CGFloat h = height.doubleValue;
    
    if (widthMode.integerValue == 1) {
        w = screenSize.width;
    }
    
    if (heightMode.integerValue == 1) {
        h = screenSize.height;
    }
    
    return CGSizeMake(w, h);
}
@end
