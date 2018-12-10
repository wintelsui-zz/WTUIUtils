//
//  UIImage+wtColorDraw.m
//  WTJapaneseLearnStart
//
//  Created by wintelsui on 2018/5/22.
//  Copyright © 2018年 SFS. All rights reserved.
//

#import "UIImage+wtColorDraw.h"

@implementation UIImage (wtColorDraw)


#pragma mark - -- 画圆 Start --

+ (UIImage *)wt_imageCircleFromRadius:(CGFloat)radius fillColor:(UIColor *)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor {
    
    return [[self class] wt_imageCircleFromDia:(radius * 2) fillColor:fillColor strokeWidth:strokeWidth strokeColor:strokeColor];
}

+ (UIImage *)wt_imageCircleFromDia:(CGFloat)diameter fillColor:(UIColor *)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor {
    CGSize size = CGSizeMake(diameter, diameter);
    
    return [[self class] wt_imageCircleFromSize:size fillColor:fillColor strokeWidth:strokeWidth strokeColor:strokeColor];
}

+ (UIImage *)wt_imageCircleFromSize:(CGSize)size fillColor:(UIColor *)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor {
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize sizeReal = CGSizeMake(size.width, size.height);
    CGFloat lineWidthReal = strokeWidth;
    
    UIGraphicsBeginImageContextWithOptions(sizeReal, false, scale);
    
    if (lineWidthReal > 0 && lineWidthReal < sizeReal.width && lineWidthReal < sizeReal.height) {
        
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(lineWidthReal/2.0, lineWidthReal/2.0, sizeReal.width - lineWidthReal, sizeReal.height - lineWidthReal)];
        [fillColor setFill];
        [ovalPath fill];
        [strokeColor setStroke];
        ovalPath.lineWidth = lineWidthReal;
        [ovalPath stroke];
    }else{
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, sizeReal.width, sizeReal.height)];
        [fillColor setFill];
        [ovalPath fill];
    }
    
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (pressedColorImg != nil) {
        NSData *data = UIImagePNGRepresentation(pressedColorImg);
        if (data != nil) {
            UIImage * image = [UIImage imageWithData:data scale:scale];
            return image;
        }
    }
    
    return nil;
}

#pragma mark - -- 画圆 End --

+ (UIImage *)wt_imageSquareWithColor:(UIColor *)color
                           lineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor
                                size:(CGSize)size
                             rounded:(BOOL)rounded
                        cornerRadius:(CGFloat)radius
                         shadowColor:(UIColor *)shadowColor
                        shadowOffset:(CGSize)shadowOffset
                    shadowBlurRadius:(CGFloat)shadowBlurRadius{
    CGFloat x = 0;
    CGFloat y = 0;
    if (lineWidth > 0 && lineColor != nil) {
        x = lineWidth / 2.0;
        y = lineWidth / 2.0;
    }
    CGFloat width = size.width;
    CGFloat height = size.height;
    if (lineWidth > 0 && lineColor != nil) {
        width += lineWidth;
        height += lineWidth;
    }
    if (shadowColor != nil && MAX(shadowOffset.width, shadowOffset.height) > 0) {
        if (shadowBlurRadius > MIN(shadowOffset.width, shadowOffset.height)) {
            shadowBlurRadius = MIN(shadowOffset.width, shadowOffset.height);
        }
        width += shadowOffset.width + shadowBlurRadius;
        height += shadowOffset.height + shadowBlurRadius;
    }
    
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), 0, [UIScreen mainScreen].scale);
    
    if (shadowColor != nil) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Shadow Declarations
        NSShadow* shadow = [[NSShadow alloc] init];
        shadow.shadowColor = shadowColor;
        shadow.shadowOffset = shadowOffset;
        shadow.shadowBlurRadius = shadowBlurRadius;
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath;
        if (rounded) {
            rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, size.width, size.height) cornerRadius: radius];
        }else{
            rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(x, y, size.width, size.height)];
        }
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
        [color setFill];
        [rectanglePath fill];
        CGContextRestoreGState(context);
        
        if (lineWidth > 0 && lineColor != nil) {
            [lineColor setStroke];
            rectanglePath.lineWidth = lineWidth;
            [rectanglePath stroke];
        }
    }else{
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, width, height) cornerRadius: radius];
        [color setFill];
        [rectanglePath fill];
        
        if (lineWidth > 0 && lineColor != nil) {
            [lineColor setStroke];
            rectanglePath.lineWidth = lineWidth;
            [rectanglePath stroke];
        }
    }
    
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}

+ (UIImage *)wt_imageRoundedSquareWithColor:(UIColor *)color
                                  lineWidth:(CGFloat)lineWidth
                                  lineColor:(UIColor *)lineColor
                                       size:(CGSize)size
                               cornerRadius:(CGFloat)radius
                                shadowColor:(UIColor *)shadowColor
                               shadowOffset:(CGSize)shadowOffset
                           shadowBlurRadius:(CGFloat)shadowBlurRadius{
    return [[self class] wt_imageSquareWithColor:color
                                    lineWidth:lineWidth lineColor:lineColor size:size rounded:YES cornerRadius:radius shadowColor:shadowColor shadowOffset:shadowOffset shadowBlurRadius:shadowBlurRadius];
    
}

+ (UIImage *)wt_imageWithColor:(UIColor *)fullColor{
    return [UIImage wt_imageWithColor:fullColor withFrame:CGRectMake(0, 0, 1, 1)];
}

+ (UIImage *)wt_imageWithColor:(UIColor *)fullColor withFrame:(CGRect)frame{
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [fullColor CGColor]);
    CGContextFillRect(context, frame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (BOOL)wt_hasAlphaChannel {
    if (self.CGImage == NULL) return NO;
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage) & kCGBitmapAlphaInfoMask;
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

- (CGContextRef)wt_bitmapARGBContextFromImage:(CGImageRef) theImage{
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    unsigned long   bitmapByteCount;
    unsigned long   bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(theImage);
    size_t pixelsHigh = CGImageGetHeight(theImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL) {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}

- (UIColor *)wt_pixColorAtPoint:(CGPoint)point{
    UIColor* color = nil;
    CGImageRef theImage = self.CGImage;
    CGContextRef context = [self wt_bitmapARGBContextFromImage:theImage];
    if (context == NULL) { return nil;  }
    
    size_t w = CGImageGetWidth(theImage);
    size_t h = CGImageGetHeight(theImage);
    CGRect rect = {{0,0},{w,h}};
    CGContextDrawImage(context, rect, theImage);
    
    unsigned char* data = CGBitmapContextGetData (context);
    if (data != NULL) {
        //offset locates the pixel in the data from x,y.
        //4 for 4 bytes of data per pixel, w is width of one row of data.
        @try {
            int offset = 4*((w*round(point.y))+round(point.x));
            NSLog(@"offset: %d", offset);
            int alpha =  data[offset];
            int red = data[offset+1];
            int green = data[offset+2];
            int blue = data[offset+3];
            NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
            color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
        }
        @catch (NSException * e) {
            NSLog(@"%@",[e reason]);
        }
        @finally {
        }
    }
    // When finished, release the context
    CGContextRelease(context);
    // Free image data memory for the context
    if (data) { free(data); }
    
    return color;
}

@end
