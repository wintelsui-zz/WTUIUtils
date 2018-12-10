//
//  UIColor+wtExtend.h
//  Pods-WTUIUtils_Example
//
//  Created by wintel on 12/10/18.
//

#import <UIKit/UIKit.h>

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
