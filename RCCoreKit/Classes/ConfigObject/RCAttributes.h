//
//  RCAttributes.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/29.
//

#import <RCCoreKit/RCCoreKit.h>
#import "RCConfigObject.h"

@class RCColor;
@class RCFont;
@class RCCorner;
@class RCDrawable;
@class RCImageSelector;
@class RCColorSelector;
@class RCFontSelector;
@class RCDrawableSelector;
@class RCSize;
@class RCInsets;
@class RCImage;
@class RCAttributesValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCAttributes : RCConfigObject
@property (nonatomic, strong, nullable) RCAttributesValue *value;
@end

@interface RCAttributesValue : NSObject
@property (nonatomic, strong, nullable) RCImageSelector *imageSelector;
@property (nonatomic, strong, nullable) RCColorSelector *colorSelector;
@property (nonatomic, strong, nullable) RCColorSelector *backgroundSelector;
@property (nonatomic, strong, nullable) RCFontSelector *fontSelector;
@property (nonatomic, strong, nullable) RCDrawableSelector *drawableSelector;
@property (nonatomic, strong, nullable) RCDrawable *drawable;
@property (nonatomic, strong, nullable) RCCorner *corner;
@property (nonatomic, strong, nullable) RCColor *textColor;
@property (nonatomic, strong, nullable) RCColor *hintColor;
@property (nonatomic, strong, nullable) RCColor *background;
@property (nonatomic, strong, nullable) RCFont *font;
@property (nonatomic, strong, nullable) RCSize *size;
@property (nonatomic, strong, nullable) RCInsets *insets;
@property (nonatomic, strong, nullable) RCImage *image;
@property (nonatomic, copy, nullable) NSString *hintText;
@property (nonatomic, copy, nullable) NSString *text;
@end

NS_ASSUME_NONNULL_END
