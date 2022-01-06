//
//  RCFont.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import "RCFont.h"

@implementation RCFont
- (UIFont *)font {
    return self.value.font;
}
@end

@implementation RCFontValue

- (UIFont *)font {
    NSNumber *size = self.size;
    NSNumber *weight = self.weight;
    
    if (!(size && weight)) {
        NSLog(@"RCInsets 数据错误");
        return nil;
    }
    return [UIFont systemFontOfSize:14 weight:[self convertIntegerToFontWeight:weight.integerValue]];
}

- (UIFontWeight)convertIntegerToFontWeight:(NSInteger)value {
    switch (value) {
        case 100:
            return UIFontWeightUltraLight;
        case 200:
            return UIFontWeightThin;
        case 300:
            return UIFontWeightLight;
        case 400:
            return UIFontWeightRegular;;
        case 500:
            return UIFontWeightMedium;
        case 600:
            return UIFontWeightSemibold;
        case 700:
            return UIFontWeightBold;
        case 800:
            return UIFontWeightHeavy;
        case 900:
            return UIFontWeightBlack;
        default:
            return UIFontWeightRegular;
    }
}

@end
