//
//  WTViewController.m
//  WTUIUtils
//
//  Created by supersmalltalk on 12/10/2018.
//  Copyright (c) 2018 supersmalltalk. All rights reserved.
//

#import "WTViewController.h"
#import "WTUIUtils.h"

//#import "UIImage+wtColorDraw.h"
//#import "UIImage+wtSize.h"

@interface WTViewController ()

@end

@implementation WTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}

- (void)loadImage{
    UIImage *imageO = [UIImage imageNamed:@"460x0w"];
    if (imageO) {
        CGRect rectCut = CGRectMake(imageO.size.width / 4.0, imageO.size.height / 4.0, imageO.size.width / 2.0, imageO.size.width / 2.0);
        
        UIImage *imageN = [imageO wt_cutImageInRect:rectCut];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageViewO = ({
                UIImageView *imageView = [[UIImageView alloc] init];
                [imageView setBackgroundColor:[UIColor blackColor]];
                [imageView setFrame:CGRectMake(20, 44, 100, 50)];
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                imageView.image = imageO;
                
                imageView;
            });
            [self.view addSubview:imageViewO];
            
            if (imageN) {
                UIImageView *imageViewN = ({
                    UIImageView *imageView = [[UIImageView alloc] init];
                    [imageView setBackgroundColor:[UIColor blackColor]];
                    [imageView setFrame:CGRectMake(20, CGRectGetMaxY(imageViewO.frame) + 10, 50, 25)];
                    imageView.contentMode = UIViewContentModeScaleAspectFit;
                    imageView.image = imageN;
                    
                    imageView;
                });
                [self.view addSubview:imageViewN];
            }
        });
        
        UIImage *imageScale = [imageO wt_scaleToSize:CGSizeMake(20, 20)];
        NSLog(@"imageScale:%@",imageScale);
        
    }
    
    UIImage *imageCircle = [UIImage wt_imageCircleFromDia:100 fillColor:[UIColor colorWithRed:0.97 green:0.54 blue:0.88 alpha:1.00]  strokeWidth:5 strokeColor:[UIColor colorWithRed:0.29 green:0.95 blue:0.63 alpha:1.00]];
    
    UIImage *imageRoundedSquare = [UIImage wt_imageRoundedSquareWithColor:[UIColor colorWithRed:0.97 green:0.54 blue:0.88 alpha:1.00] lineWidth:3 lineColor:[UIColor colorWithRed:0.29 green:0.95 blue:0.63 alpha:1.00] size:CGSizeMake(100, 100) cornerRadius:10 shadowColor:[UIColor colorWithRed:0.36 green:0.79 blue:0.96 alpha:1.00] shadowOffset:CGSizeMake(2, 2) shadowBlurRadius:2];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageCircle) {
                UIImageView *imageViewN = ({
                    UIImageView *imageView = [[UIImageView alloc] init];
                    [imageView setBackgroundColor:[UIColor clearColor]];
                    [imageView setFrame:CGRectMake(20, 160, 100 , 100)];
                    imageView.image = imageCircle;
                    
                    imageView;
                });
                [self.view addSubview:imageViewN];
            }
            if (imageRoundedSquare) {
                UIImageView *imageViewN = ({
                    UIImageView *imageView = [[UIImageView alloc] init];
                    [imageView setBackgroundColor:[UIColor clearColor]];
                    [imageView setFrame:CGRectMake(20, 270, 100 , 100)];
                    imageView.image = imageRoundedSquare;
                    
                    imageView;
                });
                [self.view addSubview:imageViewN];
            }
        });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
