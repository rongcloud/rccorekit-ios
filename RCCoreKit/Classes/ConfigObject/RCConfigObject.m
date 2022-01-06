//
//  RCConfigObject.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/21.
//

#import "RCConfigObject.h"

//static RCConfigObjectTypeKey const RCColor  = @"RCColor";
//static RCConfigObjectTypeKey const RCCorner = @"RCCorner";
//static RCConfigObjectTypeKey const RCFont   = @"RCFont";
//static RCConfigObjectTypeKey const RCImage  = @"RCImage";
//static RCConfigObjectTypeKey const RCInsets = @"RCInsets";
//static RCConfigObjectTypeKey const RCSize   = @"RCSize";

@implementation RCConfigObject
//- (NSString *)string {
//    NSString *string = (NSString *)self.value;
//    return string;
//}
//
//- (NSNumber *)number {
//    NSNumber *number = (NSNumber *)self.value;
//    return number;
//}
//
//- (NSDictionary *)dictionary {
//    NSDictionary *dictionary = (NSDictionary *)self.value;
//    if (!dictionary) {
//        NSString *msg = [NSString stringWithFormat:@"%@ parse fail",self.type];
//        NSAssert(NO, msg);
//        return nil;
//    }
//
//    if (![self validWithDictionary:dictionary]) {
//        NSAssert(NO, @"RCColor missing data");
//        return nil;
//    }
//    return dictionary;
//}
//
//- (BOOL)validWithDictionary:(NSDictionary *)dictionary{
//    if (self.type == RCColor) {
//        return [dictionary rcs_isValidColor];
//    } else if (self.type == RCCorner) {
//        return [dictionary rcs_isValidCorner];
//    } else if (self.type == RCFont) {
//        return [dictionary rcs_isValidFont];
//    } else if (self.type == RCImage) {
//        return [dictionary rcs_isValidImage];
//    } else if (self.type == RCInsets) {
//        return [dictionary rcs_isValidInsets];
//    } else if (self.type == RCSize) {
//        return [dictionary rcs_isValidInsets];
//    }
//    return YES;
//}
@end
