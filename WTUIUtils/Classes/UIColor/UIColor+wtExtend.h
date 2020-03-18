//
//  UIColor+wtExtend.h
//  Pods-WTUIUtils_Example
//
//  Created by wintel on 12/10/18.
//

#import <UIKit/UIKit.h>

#define wt_colorRGB(R,G,B)            [UIColor colorWithRed:(R) green:(G) blue:(B) alpha:1.0]
#define wt_colorRGBA(R,G,B,A)         [UIColor colorWithRed:(R) green:(G) blue:(B) alpha:(A)]
#define wt_colorRGBS(SameColor)       [UIColor colorWithRed:(SameColor) green:(SameColor) blue:(SameColor) alpha:1.0]
#define wt_colorRGBSA(SameColor,A)    [UIColor colorWithRed:(SameColor) green:(SameColor) blue:(SameColor) alpha:(A)]

#define wt_colorRGB_255(R,G,B)        [UIColor colorWithRed:(R*1.0/255.0) green:(G*1.0/255.0) blue:(B*1.0/255.0) alpha:1.0]
#define wt_colorRGBA_255(R,G,B,A)     [UIColor colorWithRed:(R*1.0/255.0) green:(G*1.0/255.0) blue:(B*1.0/255.0) alpha:(A)]
#define wt_colorRGBS_255(SameColor)   [UIColor colorWithRed:(SameColor*1.0/255.0) green:(SameColor*1.0/255.0) blue:(SameColor*1.0/255.0) alpha:1.0]
#define wt_colorRGBSA_255(SameColor,A) [UIColor colorWithRed:(SameColor*1.0/255.0) green:(SameColor*1.0/255.0) blue:(SameColor*1.0/255.0) alpha:(A)]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (wtExtend)

+ (UIColor *)wt_colorWithHex:(UInt32)hex;
+ (UIColor *)wt_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)wt_colorWithHexString:(NSString *)hexString;
+ (UIColor *)wt_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)wt_colorWith255_Red:(CGFloat)red
                           green:(CGFloat)green
                            blue:(CGFloat)blue
                           alpha:(CGFloat)alpha;

+ (UIColor *)wt_colorWith255_Red:(CGFloat)red
                           green:(CGFloat)green
                            blue:(CGFloat)blue;

+ (UIColor *)wt_colorRandom;


- (NSArray *)wt_rgbaValue;

- (NSString *)wt_HEXString;

@end

NS_ASSUME_NONNULL_END
