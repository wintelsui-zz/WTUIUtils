//
//  UIImage+wtSize.h
//  Pods-WTUIUtils_Example
//
//  Created by wintelsui on 12/10/18.
//

#import <UIKit/UIKit.h>

@interface UIImage (wtSize)

- (UIImage *)wt_cutImageInRect:(CGRect)rect;

- (UIImage *)wt_scaleToSize:(CGSize)size;

- (CVPixelBufferRef)wt_pixelBufferRef;

@end
