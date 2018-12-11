//
//  UIImage+wtSize.m
//  Pods-WTUIUtils_Example
//
//  Created by wintelsui on 12/10/18.
//

#import "UIImage+wtSize.h"

@implementation UIImage (wtSize)

- (UIImage *)wt_cutImageInRect:(CGRect)rect {
    
    CGFloat scale = self.scale;
    
    CGFloat x= rect.origin.x*scale;
    CGFloat y=rect.origin.y*scale;
    CGFloat w=rect.size.width*scale;
    CGFloat h=rect.size.height*scale;
    
    CGSize originalSize = self.size;
    if (x > originalSize.width) {
        x = 0;
    }
    if (y > originalSize.height) {
        y = 0;
    }
    if (x + w > originalSize.width) {
        w = originalSize.width - x;
    }
    if (y + h > originalSize.height) {
        h = originalSize.width - y;
    }
    CGRect cutRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef originalImageRef = [self CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(originalImageRef, cutRect);
    
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    return newImage;
}

- (UIImage *)wt_scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (CVPixelBufferRef)wt_pixelBufferRef {
    CGImageRef imageRef = self.CGImage;
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    
    CVPixelBufferRef pxbuffer = NULL;
    
    CGFloat imageWidth = CGImageGetWidth(imageRef);
    CGFloat imageHeight = CGImageGetHeight(imageRef);
    
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault,
                                          imageWidth,
                                          imageHeight,
                                          kCVPixelFormatType_32ARGB,
                                          (__bridge CFDictionaryRef) options,
                                          &pxbuffer);
    
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata != NULL);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(pxdata,
                                                 imageWidth,
                                                 imageHeight,
                                                 8,
                                                 CVPixelBufferGetBytesPerRow(pxbuffer),
                                                 rgbColorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipFirst);
    NSParameterAssert(context);
    CGContextConcatCTM(context, CGAffineTransformIdentity);
    CGContextDrawImage(context, CGRectMake(0,
                                           0,
                                           imageWidth,
                                           imageHeight),
                       imageRef);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}


@end

