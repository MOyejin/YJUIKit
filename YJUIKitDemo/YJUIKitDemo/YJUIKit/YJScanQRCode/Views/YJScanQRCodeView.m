//
//  YJScanQRCodeView.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJScanQRCodeView.h"
#import "UIScreen+YJScreen.h"
#import "UIColor+YJColor.h"
#import "UIImage+YJImage.h"

@interface YJScanQRCodeView ()

@property (nonatomic, strong) CALayer *yj_topLayer;
@property (nonatomic, strong) CALayer *yj_leftLayer;
@property (nonatomic, strong) CALayer *yj_bottomLayer;
@property (nonatomic, strong) CALayer *yj_rightLayer;

@property (nonatomic, strong) CALayer *yj_scanQRCodePickLayer;

@end

@implementation YJScanQRCodeView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self yj_addConstraintsWithSuperView];
}

- (CALayer *)yj_scanQRCodePickLayer {
    
    if (!_yj_scanQRCodePickLayer) {
        
        _yj_scanQRCodePickLayer = [CALayer layer];
        
        _yj_scanQRCodePickLayer.contents = (__bridge id _Nullable)([UIImage yj_getImageWithBundleName:@"YJResource"
                                                                                            imageName:@"scan_pick"].CGImage);
        
        _yj_scanQRCodePickLayer.position = CGPointMake(self.center.x,
                                                       self.center.y - [UIScreen yj_fitScreen:200]);
        _yj_scanQRCodePickLayer.bounds   = CGRectMake(0,
                                                      0,
                                                      [UIScreen yj_fitScreen:500],
                                                      [UIScreen yj_fitScreen:500]);
    }
    
    return _yj_scanQRCodePickLayer;
}

#pragma mark - Mask CALayers
- (CALayer *)yj_topLayer {
    
    if (!_yj_topLayer) {
        
        _yj_topLayer = [CALayer layer];
        
        _yj_topLayer.backgroundColor = [UIColor yj_colorWithHex:0x000000
                                                          alpha:0.4].CGColor;
        
        _yj_topLayer.frame = CGRectMake(0,
                                        0,
                                        [UIScreen yj_getScreenWidth],
                                        CGRectGetMinY(self.yj_scanQRCodePickLayer.frame));
    }
    
    return _yj_topLayer;
}

- (CALayer *)yj_leftLayer {
    
    if (!_yj_leftLayer) {
        
        _yj_leftLayer = [CALayer layer];
        
        _yj_leftLayer.backgroundColor = [UIColor yj_colorWithHex:0x000000
                                                           alpha:0.4].CGColor;
        
        _yj_leftLayer.frame = CGRectMake(0,
                                         CGRectGetMaxY(self.yj_topLayer.frame),
                                         CGRectGetMinX(self.yj_scanQRCodePickLayer.frame),
                                         CGRectGetHeight(self.yj_scanQRCodePickLayer.frame));
    }
    
    return _yj_leftLayer;
}

- (CALayer *)yj_bottomLayer {
    
    if (!_yj_bottomLayer) {
        
        _yj_bottomLayer = [CALayer layer];
        
        _yj_bottomLayer.backgroundColor = [UIColor yj_colorWithHex:0x000000
                                                             alpha:0.4].CGColor;
        
        _yj_bottomLayer.frame = CGRectMake(0,
                                           CGRectGetMaxY(self.yj_scanQRCodePickLayer.frame),
                                           [UIScreen yj_getScreenWidth],
                                           [UIScreen yj_getScreenHeight] - CGRectGetMinY(self.yj_scanQRCodePickLayer.frame));
    }
    
    return _yj_bottomLayer;
}

- (CALayer *)yj_rightLayer {
    
    if (!_yj_rightLayer) {
        
        _yj_rightLayer = [CALayer layer];
        
        _yj_rightLayer.backgroundColor = [UIColor yj_colorWithHex:0x000000
                                                            alpha:0.4].CGColor;
        _yj_rightLayer.frame = CGRectMake(CGRectGetMaxX(self.yj_scanQRCodePickLayer.frame),
                                          CGRectGetMaxY(self.yj_topLayer.frame),
                                          [UIScreen yj_getScreenWidth] - CGRectGetMaxX(self.yj_scanQRCodePickLayer.frame),
                                          CGRectGetHeight(self.yj_scanQRCodePickLayer.frame));
    }
    
    return _yj_rightLayer;
}

- (void)yj_addConstraintsWithSuperView {
    
    [self.layer addSublayer:self.yj_scanQRCodePickLayer];
    
    [self.layer addSublayer:self.yj_topLayer];
    [self.layer addSublayer:self.yj_leftLayer];
    [self.layer addSublayer:self.yj_bottomLayer];
    [self.layer addSublayer:self.yj_rightLayer];
}


@end
