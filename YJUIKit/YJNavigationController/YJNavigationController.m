//
//  YJNavigationController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJNavigationController.h"

@interface YJNavigationController ()

@end

@implementation YJNavigationController

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController
                     animated:animated];
}

- (void)setyj_backgroundImage:(UIImage *)yj_backgroundImage {
    
    _yj_backgroundImage = yj_backgroundImage;
    
    [self.navigationBar setBackgroundImage:yj_backgroundImage
                             forBarMetrics:UIBarMetricsDefault];
}

- (void)setyj_tintColor:(UIColor *)yj_tintColor {
    
    _yj_tintColor = yj_tintColor;
    
    [self.navigationBar setTintColor:yj_tintColor];
}

- (void)setyj_foregroundColor:(UIColor *)yj_foregroundColor {
    
    _yj_foregroundColor = yj_foregroundColor;
    
    NSDictionary *yj_dictionary = @{NSForegroundColorAttributeName : yj_foregroundColor};
    
    [self.navigationBar setTitleTextAttributes:yj_dictionary];
}

- (void)setyj_shadowImage:(UIImage *)yj_shadowImage {
    
    _yj_shadowImage = yj_shadowImage;
    
    [self.navigationBar setShadowImage:yj_shadowImage];
}


@end
