 
//  UIScreen+YJScreen.m
//
//  Created by Moyejin668 on 11/10/16.
//  Copyright © 2016年 Moyejin668. All rights reserved.
//

#import "UIScreen+YJScreen.h"
#import "UIDevice+YJDevice.h"

@implementation UIScreen (YJScreen)

#pragma mark - 获取屏幕相关的
+ (CGFloat)yj_getScreenScale {
    
    return [self mainScreen].scale;
}

+ (CGSize)yj_getScreenSize {
    
    return [[self mainScreen] bounds].size;
}

+ (CGFloat)yj_getScreenWidth {
    return [[self mainScreen] bounds].size.width;
}

+ (CGFloat)yj_getScreenHeight {
    return [[self mainScreen] bounds].size.height;
}

#pragma mark - 适配iPad, iPhone, iPod Touch
+ (CGFloat)yj_fitScreen:(CGFloat)value {
    
    if ([[UIDevice yj_getDeviceModelType] isEqualToString:@"iPad"]) {
        return ceilf([self yj_getScreenWidth] / (1668.0f / 2)  * (value / 2.0f));
    } else {
        return ceilf([self yj_getScreenWidth] / (750.0f / 2)  * (value / 2.0f));
    }
}

+ (CGFloat)yj_fitPlusScreen:(CGFloat)value {
    
    if ([[UIDevice yj_getDeviceModelType] isEqualToString:@"iPad"]) {
        return ceilf([self yj_getScreenWidth] / (1668.0f / 2)  * (value / 2.0f));
    } else {
        return ceilf([self yj_getScreenWidth] / (1080.0f / 2)  * (value / 2.0f));
    }
}

#pragma mark - 获取UITabBar的高度
+ (CGFloat)yj_getTabBarHeight {
    
    UIViewController *yj_rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([yj_rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *yj_tabBarController = (UITabBarController *)yj_rootViewController;
        
        return CGRectGetHeight(yj_tabBarController.tabBar.frame);
    } else {
        
        return 0.f;
    }
}

@end
