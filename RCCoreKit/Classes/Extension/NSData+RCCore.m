//
//  NSData+RCCore.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/15.
//

#import "NSData+RCCore.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (MD5)
- (NSString *)rcc_md5 {
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, self.bytes, (CC_LONG)self.length);
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(result, &md5);
    NSMutableString *resultString = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [resultString appendFormat:@"%02x", result[i]];
    }
    return resultString;
}
@end
