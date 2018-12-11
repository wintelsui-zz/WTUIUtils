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

/**
 Get square image with rounded corner and shadow
 
 @param color full color
 @param lineWidth out line width
 @param lineColor out line color
 @param size size
 @param rounded rounded enable
 @param radius radius
 @param shadowColor shadow color
 @param shadowOffset shadow offset
 @param shadowBlurRadius shadow blur radius
 @return image
 */
+ (UIImage *)wt_imageSquareWithColor:(UIColor *)color
                           lineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor
                                size:(CGSize)size
                             rounded:(BOOL)rounded
                        cornerRadius:(CGFloat)radius
                         shadowColor:(UIColor *)shadowColor
                        shadowOffset:(CGSize)shadowOffset
                    shadowBlurRadius:(CGFloat)shadowBlurRadius;

/**
 Get square image with rounded corner and shadow

 @param color full color
 @param lineWidth out line width
 @param lineColor out line color
 @param size size
 @param radius radius
 @param shadowColor shadow color
 @param shadowOffset shadow offset
 @param shadowBlurRadius shadow blur radius
 @return image
 */
+ (UIImage *)wt_imageRoundedSquareWithColor:(UIColor *)color
                                  lineWidth:(CGFloat)lineWidth
                                  lineColor:(UIColor *)lineColor
                                       size:(CGSize)size
                               cornerRadius:(CGFloat)radius
                                shadowColor:(UIColor *)shadowColor
                               shadowOffset:(CGSize)shadowOffset
                           shadowBlurRadius:(CGFloat)shadowBlurRadius;

/**
 Get a image by color and size(1,1)
 
 @param fullColor color
 @return image
 */
+ (UIImage *)wt_imageWithColor:(UIColor *)fullColor;

/**
 Get a image by color and size

 @param fullColor color
 @param size size
 @return image
 */
+ (UIImage *)wt_imageWithColor:(UIColor *)fullColor withSize:(CGSize)size;

/**
 UIImage has alpha channel?

 @return has?
 */
- (BOOL)wt_hasAlphaChannel;

/**
 UIImage -> CGContextRef

 @param theImage theImage
 @return CGContextRef
 */
- (CGContextRef)wt_bitmapARGBContextFromImage:(CGImageRef)theImage;

/**
 UIimage point color

 @param point pick point
 @return pix color
 */
- (UIColor *)wt_pixColorAtPoint:(CGPoint)point;


@end
