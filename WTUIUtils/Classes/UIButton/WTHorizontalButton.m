//
//  WTHorizontalButton.m
//
//  Created by wintelsui on 16/10/12.
//  Copyright © 2016年 wintelsui. All rights reserved.
//

#import "WTHorizontalButton.h"

@implementation WTHorizontalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gap = 10;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gap = 10;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.clipsToBounds = YES;
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGRect newFrame = [self titleLabel].frame;
    
        // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    if (self.contentVerticalAlignment == UIControlContentVerticalAlignmentTop) {
        
        center.y = self.imageView.frame.size.height / 2;
    }
    else {
        
        center.y = (height - CGRectGetHeight(newFrame) - _gap - self.imageView.frame.size.height) / 2 + self.imageView.frame.size.height / 2;
    }
    self.imageView.center = center;
    
        //Center text
    newFrame.origin.x = 0;
    newFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + _gap;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel sizeToFit];
    
    center = self.titleLabel.center;
    center.x = width / 2.0;
    self.titleLabel.center = center;
    
    if (self.contentVerticalAlignment != UIControlContentVerticalAlignmentTop && CGRectGetHeight(newFrame) != CGRectGetHeight([self titleLabel].frame)) {
        
        CGRect newFrame = [self titleLabel].frame;
        CGPoint center = self.imageView.center;
        center.x = self.frame.size.width/2;
        center.y = (height - CGRectGetHeight(newFrame) - _gap - self.imageView.frame.size.height) / 2 + self.imageView.frame.size.height / 2;
        
        self.imageView.center = center;
        
            //Center text
        newFrame.origin.x = 0;
        newFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + _gap;
        newFrame.size.width = self.frame.size.width;
        
        self.titleLabel.frame = newFrame;
    }
}
@end
