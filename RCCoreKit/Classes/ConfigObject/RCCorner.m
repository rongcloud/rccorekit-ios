//
//  RCCorner.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCCorner.h"

@implementation RCCorner
- (UIEdgeInsets)corner {
    
    NSNumber *tl = self.value.topLeft;
    NSNumber *tr = self.value.topRight;
    NSNumber *bl = self.value.bottomLeft;
    NSNumber *br = self.value.bottomRight;
    
    if (!(tl && tr && bl && br)) return UIEdgeInsetsZero;
    
    CGFloat topLeft = tl.doubleValue;
    CGFloat topRight = tr.doubleValue;
    CGFloat bottomLeft = bl.doubleValue;
    CGFloat bottomRight = br.doubleValue;
    
    return UIEdgeInsetsMake(topLeft, topRight, bottomLeft, bottomRight);
}

- (CGFloat)radius {
    if (self.value == nil || UIEdgeInsetsEqualToEdgeInsets(self.corner, UIEdgeInsetsZero)) {
        return 0;
    }
    if (UIEdgeInsetsEqualToEdgeInsets(self.corner, UIEdgeInsetsMake(self.corner.top, self.corner.top, self.corner.top, self.corner.top))) {
        return self.corner.top;
    }
    return 0;
}
@end

@implementation RCCornerValue

@end
