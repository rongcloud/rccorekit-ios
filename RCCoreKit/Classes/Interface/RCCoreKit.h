//
//  RCCoreKit.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/6.
//

#import <Foundation/Foundation.h>

//! Project version number for RCCoreKit.
FOUNDATION_EXPORT double RCCoreKitVersionNumber;

//! Project version string for RCCoreKit.
FOUNDATION_EXPORT const unsigned char RCCoreKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <RCCoreKit/PublicHeader.h>
# if __has_include(<RCCoreKit/RCCoreKit.h>)
#import <RCCoreKit/RCCoreKit.h>
#import <RCCoreKit/RCCoreEngine.h>
#import <RCCoreKit/RCCoreModule.h>
#import <RCCoreKit/RCCoreSummary.h>
#import <RCCoreKit/RCAttributes.h>
#import <RCCoreKit/RCBoolean.h>
#import <RCCoreKit/RCColor.h>
#import <RCCoreKit/RCColorSelector.h>
#import <RCCoreKit/RCCorner.h>
#import <RCCoreKit/RCDrawable.h>
#import <RCCoreKit/RCDrawableSelector.h>
#import <RCCoreKit/RCFont.h>
#import <RCCoreKit/RCFontSelector.h>
#import <RCCoreKit/RCImage.h>
#import <RCCoreKit/RCImageSelector.h>
#import <RCCoreKit/RCInsets.h>
#import <RCCoreKit/RCConfigObject.h>
#import <RCCoreKit/RCNumber.h>
#import <RCCoreKit/RCRadio.h>
#import <RCCoreKit/RCSize.h>
#import <RCCoreKit/RCString.h>
#else
#import "RCCoreKit.h"
#import "RCSceneEngine.h"
#import "RCKitModule.h"
#import "RCCoreSummary.h"
#import "RCAttributes.h"
#import "RCBoolean.h"
#import "RCColor.h"
#import "RCColorSelector.h"
#import "RCCorner.h"
#import "RCDrawable.h"
#import "RCDrawableSelector.h"
#import "RCFont.h"
#import "RCFontSelector.h"
#import "RCImage.h"
#import "RCImageSelector.h"
#import "RCInsets.h"
#import "RCConfigObject.h"
#import "RCNumber.h"
#import "RCRadio.h"
#import "RCSize.h"
#import "RCString.h"
#endif

