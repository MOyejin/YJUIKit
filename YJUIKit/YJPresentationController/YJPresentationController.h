//
//  YJPresentationController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJPresentationViewStyle) {
    
    YJPresentationViewStyleNormal = 0,
    YJPresentationViewStyleBluf
};

@interface YJPresentationController : UIPresentationController

/**
 需要展示内容的高度
 */
@property (nonatomic, assign) CGFloat yj_presentationViewHeight;

/**
 动画时间
 */
@property (nonatomic, assign) CGFloat yj_animationDuration;

/**
 是否需要UITapGestureRecognizer手势, 默认为YES
 */
@property (nonatomic, assign) BOOL yj_isNeedTapGestureRecognizer;

/**
 设置背景颜色, 只在YJPresentationViewStyleBluf样式下有效, 默认为[[UIColor blackColor] colorWithAlphaComponent:0.5]
 */
@property (nonatomic, strong) UIColor *yj_backgroundColor;

/**
 设置YJPresentationController的样式, 默认为YJPresentationViewStyleNormal
 */
@property (nonatomic, assign) YJPresentationViewStyle yj_presentationViewStyle;

/**
 设置UIBlurEffectStyle, 只在YJPresentationViewStyleBluf样式下有效
 */
@property (nonatomic, assign) UIBlurEffectStyle yj_blurEffectStyle;


@end

NS_ASSUME_NONNULL_END
