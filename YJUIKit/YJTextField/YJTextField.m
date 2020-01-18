//
//  YJTextField.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTextField.h"
#import "UIColor+YJColor.h"
#import "UIScreen+YJScreen.h"

@interface YJTextField ()

@property (nonatomic, strong) UIImageView *yj_lineImageView;

@end


@implementation YJTextField

- (void)setYj_textFieldType:(YJTextFieldType)yj_textFieldType {
    
    _yj_textFieldType = yj_textFieldType;
    
    if (yj_textFieldType == YJTextFieldBottomLineType) {
        
        [self yj_addConstraintsWithSuperView];
    }
}

- (void)setyj_lineColor:(UIColor *)yj_lineColor {
    
    self.yj_lineImageView.backgroundColor = yj_lineColor;
}

- (UIImageView *)yj_lineImageView {
    
    if (!_yj_lineImageView) {
        
        _yj_lineImageView = [[UIImageView alloc] init];
        
        _yj_lineImageView.backgroundColor = [UIColor yj_colorWithHex:0xf0f0f0];
        _yj_lineImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _yj_lineImageView;
}

- (void)yj_addConstraintsWithSuperView  {
    
    [self addSubview:self.yj_lineImageView];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.yj_lineImageView
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.yj_lineImageView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rigthtConstraint = [NSLayoutConstraint constraintWithItem:self.yj_lineImageView
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0
                                                                         constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.yj_lineImageView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:0
                                                                         constant:[UIScreen yj_fitScreen:1]];
    
    [self addConstraints:@[leftConstraint, bottomConstraint, rigthtConstraint, heightConstraint]];
}

@end
