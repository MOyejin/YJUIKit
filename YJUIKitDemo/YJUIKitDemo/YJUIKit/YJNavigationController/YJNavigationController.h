//
//  YJNavigationController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJNavigationController : UINavigationController

/**
 设置UINavigationBar的背景图
 */
@property (nonatomic, strong) UIImage *yj_backgroundImage;

/**
 设置UINavigationBar的Tint Color
 */
@property (nonatomic, strong) UIColor *yj_tintColor;

/**
 设置UINavigationBar的Foreground Color
 */
@property (nonatomic, strong) UIColor *yj_foregroundColor;

/**
 设置UINavigationBar的Shadow Image
 */
@property (nonatomic, strong) UIImage *yj_shadowImage;

@end

NS_ASSUME_NONNULL_END
