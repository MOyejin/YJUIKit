//
//  YJButton.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJButton.h"

@implementation YJButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _yj_imageSize    = CGSizeZero;
        _yj_imageSpacing = 10;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self yj_addConstraintsWithSuperView];
}

- (void)yj_addConstraintsWithSuperView {
    
    if (!self.imageView.image) {
        return;
    }
    
    if (CGSizeEqualToSize(CGSizeZero, self.yj_imageSize)) {
        
        [self.imageView sizeToFit];
    } else {
        
        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x,
                                          self.imageView.frame.origin.y,
                                          self.yj_imageSize.width,
                                          self.yj_imageSize.height);
    }
    
    [self.titleLabel sizeToFit];
    
    [self yj_configButtonImageAndLabel];
}

- (void)yj_configButtonImageAndLabel {
    
    switch (self.yj_buttomImageStyle) {
        case YJButtonImageTopStyle:
            
            [self yj_layoutVerticalWithTopView:self.imageView
                                    bottomView:self.titleLabel];
            
            break;
        case YJButtonImageLeftStyle:
            
            [self yj_layoutHorizontalWithLeftView:self.imageView
                                        rightView:self.titleLabel];
            
            break;
        case YJButtonImageBottomStyle:
            
            [self yj_layoutVerticalWithTopView:self.titleLabel
                                    bottomView:self.imageView];
            
            break;
        case YJButtonImageRightStyle:
            
            [self yj_layoutHorizontalWithLeftView:self.titleLabel
                                        rightView:self.imageView];
            break;
        default:
            break;
    }
}

- (void)yj_layoutHorizontalWithLeftView:(UIView *)leftView
                              rightView:(UIView *)rightView {
    
    CGRect leftViewFrame = leftView.frame;
    CGRect rightViewFrame = rightView.frame;
    
    CGFloat totalWidth = CGRectGetWidth(leftViewFrame) + self.yj_imageSpacing + CGRectGetWidth(rightViewFrame);
    
    leftViewFrame.origin.x = (CGRectGetWidth(self.frame) - totalWidth) / 2.0;
    leftViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(leftViewFrame)) / 2.0;
    
    leftView.frame = leftViewFrame;
    
    rightViewFrame.origin.x = CGRectGetMaxX(leftViewFrame) + self.yj_imageSpacing;
    rightViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(rightViewFrame)) / 2.0;
    
    rightView.frame = rightViewFrame;
}

- (void)yj_layoutVerticalWithTopView:(UIView *)upView
                          bottomView:(UIView *)downView {
    
    CGRect upViewFrame = upView.frame;
    CGRect downViewFrame = downView.frame;
    
    CGFloat totalHeight = CGRectGetHeight(upViewFrame) + self.yj_imageSpacing + CGRectGetHeight(downViewFrame);
    
    upViewFrame.origin.y = (CGRectGetHeight(self.frame) - totalHeight) / 2.0;
    upViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(upViewFrame)) / 2.0;
    
    upView.frame = upViewFrame;
    
    downViewFrame.origin.y = CGRectGetMaxY(upViewFrame) + self.yj_imageSpacing;
    downViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(downViewFrame)) / 2.0;
    
    downView.frame = downViewFrame;
}

- (void)setImage:(UIImage *)image
        forState:(UIControlState)state {
    
    [super setImage:image
           forState:state];
    
    [self setNeedsLayout];
}

- (void)setTitle:(NSString *)title
        forState:(UIControlState)state {
    
    [super setTitle:title
           forState:state];
    
    [self setNeedsLayout];
}

- (void)setyj_imageSize:(CGSize)yj_imageSize {
    
    _yj_imageSize = yj_imageSize;
    
    [self setNeedsLayout];
}

- (void)setyj_imageSpacing:(CGFloat)yj_imageSpacing {
    
    _yj_imageSpacing = yj_imageSpacing;
    
    [self setNeedsLayout];
}

@end
