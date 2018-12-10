//
//  UIColor+wtExtend.m
//  Pods-WTUIUtils_Example
//
//  Created by wintel on 12/10/18.
//

#import "UIColor+wtExtend.h"

CGFloat wt_colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


@implementation UIColor (wtExtend)

+ (UIColor *)wt_colorWithHex:(UInt32)hex{
    return [UIColor wt_colorWithHex:hex andAlpha:1];
}
+ (UIColor *)wt_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}

+ (UIColor *)wt_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    CGFloat red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    alpha = alpha;
    red   = wt_colorComponentFrom(colorString, 0, 2);
    green = wt_colorComponentFrom(colorString, 2, 2);
    blue  = wt_colorComponentFrom(colorString, 4, 2);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)wt_colorWithHexString:(NSString *)hexString {
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = wt_colorComponentFrom(colorString, 0, 1);
            green = wt_colorComponentFrom(colorString, 1, 1);
            blue  = wt_colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = wt_colorComponentFrom(colorString, 0, 1);
            red   = wt_colorComponentFrom(colorString, 1, 1);
            green = wt_colorComponentFrom(colorString, 2, 1);
            blue  = wt_colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = wt_colorComponentFrom(colorString, 0, 2);
            green = wt_colorComponentFrom(colorString, 2, 2);
            blue  = wt_colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = wt_colorComponentFrom(colorString, 0, 2);
            red   = wt_colorComponentFrom(colorString, 2, 2);
            green = wt_colorComponentFrom(colorString, 4, 2);
            blue  = wt_colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)wt_colorWith255_Red:(CGFloat)red
                           green:(CGFloat)green
                            blue:(CGFloat)blue
                           alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f
                           green:green/255.f
                            blue:blue/255.f
                           alpha:alpha];
}

+ (UIColor *)wt_colorWith255_Red:(CGFloat)red
                           green:(CGFloat)green
                            blue:(CGFloat)blue
{
    return [self wt_colorWith255_Red:red
                               green:green
                                blue:blue
                               alpha:1.0];
}

+ (UIColor *)wt_colorRandom {
    return [UIColor colorWithRed:(arc4random()%256)/255.f
                           green:(arc4random()%256)/255.f
                            blue:(arc4random()%256)/255.f
                           alpha:1];
}


- (NSArray *)wt_rgbaValue{
    CGFloat R = 0, G = 0, B = 0, A = 1.0;
    int numComponents = (int)CGColorGetNumberOfComponents(self.CGColor);
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    if (numComponents > 2) {
        R = components[0];
        G = components[1];
        B = components[2];
        if (numComponents == 4) {
            A = components[3];
        }
    }
    return @[@(R),@(G),@(B),@(A)];
}

- (NSString *)wt_HEXString{
    UIColor* color = self;
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}


@end
