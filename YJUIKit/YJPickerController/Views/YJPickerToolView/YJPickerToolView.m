//
//  YJPickerToolView.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerToolView.h"
#import "UIColor+YJColor.h"
#import "UIButton+YJButton.h"
#import "UIView+YJView.h"

@interface YJPickerToolView ()

@property (nonatomic, strong, readwrite) UIButton *yj_cancelButton;
@property (nonatomic, strong, readwrite) UIButton *yj_defineButton;

@property (nonatomic, strong, readwrite) UILabel *yj_titleLabel;

@property (nonatomic, strong) CALayer *yj_lineLayer;

@end

@implementation YJPickerToolView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self yj_addConstraintsWithSuperView];
}

- (UIButton *)yj_cancelButton {
    
    if (!_yj_cancelButton) {
        
        __weak __typeof(self) weakSelf = self;
        
        _yj_cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_yj_cancelButton yj_setNormalButtonWithTitle:@"取消"];
        [_yj_cancelButton yj_setNormalTitleWithColor:[UIColor yj_colorWithHex:0x333333]];
        
        [_yj_cancelButton yj_addButtonActionComplete:^(UIButton *sender) {
            
            if (weakSelf.yj_pickerToolViewCancelActionBlock) {
                weakSelf.yj_pickerToolViewCancelActionBlock();
            }
        }];
    }
    
    return _yj_cancelButton;
}

- (UIButton *)yj_defineButton {
    
    if (!_yj_defineButton) {
        
        __weak __typeof(self) weakSelf = self;
        
        _yj_defineButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_yj_defineButton yj_setNormalButtonWithTitle:@"确定"];
        [_yj_defineButton yj_setNormalTitleWithColor:[UIColor yj_colorWithHex:0x333333]];
        
        [_yj_defineButton yj_addButtonActionComplete:^(UIButton *sender) {
            
            if (weakSelf.yj_pickerToolViewDefineActionBlock) {
                weakSelf.yj_pickerToolViewDefineActionBlock();
            }
        }];
    }
    
    return _yj_defineButton;
}

- (UILabel *)yj_titleLabel {
    
    if (!_yj_titleLabel) {
        
        _yj_titleLabel = [[UILabel alloc] init];
        
        _yj_titleLabel.text          = @"标题";
        _yj_titleLabel.textColor     = [UIColor yj_colorWithHex:0x999999];
        _yj_titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _yj_titleLabel;
}

- (CALayer *)yj_lineLayer {
    
    if (!_yj_lineLayer) {
        
        _yj_lineLayer = [CALayer layer];
        
        _yj_lineLayer.backgroundColor = [UIColor yj_colorWithHex:0xFDFDFD].CGColor;
    }
    
    return _yj_lineLayer;
}

- (void)yj_addConstraintsWithSuperView  {
    
    self.backgroundColor = [UIColor yj_colorWithHex:0xFDFDFD];
    
    [self.layer addSublayer:self.yj_lineLayer];
    
    [self addSubview:self.yj_cancelButton];
    [self addSubview:self.yj_titleLabel];
    [self addSubview:self.yj_defineButton];
    
    CGFloat yj_titleLabelX   = self.yj_width / 2 - 50;
    CGFloat yj_defineButtonX = self.yj_width - 60;
    
    self.yj_lineLayer.frame    = CGRectMake(0, CGRectGetWidth(self.frame) - 1, CGRectGetHeight(self.frame), 1);
    self.yj_cancelButton.frame = CGRectMake(10, 0, 50, self.yj_height);
    self.yj_defineButton.frame = CGRectMake(yj_defineButtonX, 0, 50, self.yj_height);
    self.yj_titleLabel.frame   = CGRectMake(yj_titleLabelX, 0, 100, self.yj_height);
}

@end
