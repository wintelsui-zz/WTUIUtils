//
//  UIImage+wtColorDraw.h
//  WTJapaneseLearnStart
//
//  Created by wintelsui on 2018/5/22.
//  Copyright © 2018年 SFS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (wtColorDraw)

+ (UIImage *)wt_imageCircleFromRadius:(CGFloat)radius fillColor:(UIColor *)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor;

+ (UIImage *)wt_imageCircleFromDia:(CGFloat)diameter fillColor:(UIColor *)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor;

+ (UIImage *)wt_imageCircleFromSize:(CGSize)size fillColor:(UIColor *)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor;

+ (UIImage *)wt_imageSquareWithColor:(UIColor *)color
                           lineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor
                                size:(CGSize)size
                             rounded:(BOOL)rounded
                        cornerRadius:(CGFloat)radius
                         shadowColor:(UIColor *)shadowColor
                        shadowOffset:(CGSize)shadowOffset
                    shadowBlurRadius:(CGFloat)shadowBlurRadius;

+ (UIImage *)wt_imageRoundedSquareWithColor:(UIColor *)color
                                  lineWidth:(CGFloat)lineWidth
                                  lineColor:(UIColor *)lineColor
                                       size:(CGSize)size
                               cornerRadius:(CGFloat)radius
                                shadowColor:(UIColor *)shadowColor
                               shadowOffset:(CGSize)shadowOffset
                           shadowBlurRadius:(CGFloat)shadowBlurRadius;

+ (UIImage *)wt_imageWithColor:(UIColor *)fullColor;

+ (UIImage *)wt_imageWithColor:(UIColor *)fullColor withFrame:(CGRect)frame;

- (BOOL)wt_hasAlphaChannel;

- (CGContextRef)wt_bitmapARGBContextFromImage:(CGImageRef)theImage;

- (UIColor *)wt_pixColorAtPoint:(CGPoint)point;


@end
