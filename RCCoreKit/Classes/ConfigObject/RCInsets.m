//
//  RCInsets.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCInsets.h"

@implementation RCInsets
- (UIEdgeInsets)insets {
    return self.value.insets;
}
@end

@implementation RCInsetsValue
- (UIEdgeInsets)insets {
    NSNumber *t = self.top;
    NSNumber *l = self.left;
    NSNumber *b = self.bottom;
    NSNumber *r = self.right;
    
    if (!(t && l && b && r)) {
        NSLog(@"RCInsets 数据错误");
        return UIEdgeInsetsZero;
    }
    
    CGFloat top = t.doubleValue;
    CGFloat left = l.doubleValue;
    CGFloat bottom = b.doubleValue;
    CGFloat right = r.doubleValue;
    
    return UIEdgeInsetsMake(top, left, bottom, right);
}
@end
