//
//  NSBundle+RCCore.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/10.
//

#import "NSBundle+RCCore.h"

@implementation NSBundle (Path)
+ (NSString *)rcc_pathForName:(NSString *)bundleName {
    
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"RCCoreEngine")];
    
    NSString *resourcePath = [bundle resourcePath];
    
    NSString *path = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",bundleName]];

    return path;
}
@end
