 
//  UIScreen+YJScreen.h
//
//  Created by Moyejin668 on 11/10/16.
//  Copyright © 2016年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (YJScreen)

/**
 获取屏幕的比例

 @return CGFloat
 */
+ (CGFloat)yj_getScreenScale;

/**
 获取屏幕的尺寸

 @return CGSize
 */
+ (CGSize)yj_getScreenSize;

/**
 获取屏幕宽度
 
 @return CGFloat
 */
+ (CGFloat)yj_getScreenWidth;

/**
 获取屏幕高度
 
 @return CGFloat
 */
+ (CGFloat)yj_getScreenHeight;

/**
 iPhone是以 (iPhone 6)1334x750 为基准, iPad是以 (iPad Pro 10.5)2224x1668 为基准

 @param value UI原始值
 @return CGFloat
 */
+ (CGFloat)yj_fitScreen:(CGFloat)value;

/**
 适配iPhone Plus机型的尺寸

 @param value UI原始值
 @return CGFloat
 */
+ (CGFloat)yj_fitPlusScreen:(CGFloat)value;

/**
 获取UITabBar的高度

 @return CGFloat
 */
+ (CGFloat)yj_getTabBarHeight;

@end
