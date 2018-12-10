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

@end
