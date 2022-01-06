//
//  RCColor.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCColor.h"

@implementation RCColor
- (UIColor *)color {
    return self.value.color;
}
@end

@implementation RCColorValue
- (UIColor *)color {
    NSNumber *r = self.red;
    NSNumber *g = self.green;
    NSNumber *b = self.blue;
    NSNumber *a = self.alpha;
    
    if (r == nil || g == nil || b == nil || a == nil) return nil;
    
    return [UIColor colorWithRed:r.doubleValue/255.f green:g.doubleValue/255.f blue:b.doubleValue/255.f alpha:a.floatValue];
}
@end
