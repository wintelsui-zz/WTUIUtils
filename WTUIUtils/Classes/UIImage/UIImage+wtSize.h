//
//  UIImage+wtSize.h
//  Pods-WTUIUtils_Example
//
//  Created by wintelsui on 12/10/18.
//

#import <UIKit/UIKit.h>

@interface UIImage (wtSize)

/**
 UIImage cut

 @param rect cut rect
 @return cutImage
 */
- (UIImage *)wt_cutImageInRect:(CGRect)rect;

/**
 UIImage scale

 @param size scaleSize
 @return scaleImage
 */
- (UIImage *)wt_scaleToSize:(CGSize)size;


/**
 UIImage -> CVPixelBufferRef

 @return CVPixelBufferRef
 */
- (CVPixelBufferRef)wt_pixelBufferRef;

@end
