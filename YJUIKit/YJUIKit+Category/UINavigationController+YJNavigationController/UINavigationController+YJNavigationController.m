//
//  UINavigationController+YJNavigationController.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/27.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UINavigationController+YJNavigationController.h"
#import "NSArray+YJArray.h"

@implementation UINavigationController (YJNavigationController)

- (UIViewController *)yj_findViewControllerWithYJassName:(NSString *)YJassName {
    
    UIViewController *__block yj_viewController;
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:NSClassFromString(YJassName)]) {
            
            yj_viewController = obj;
        }
    }];
    
    return yj_viewController;
}

- (NSUInteger)yj_getIndexWithViewController:(UIViewController *)viewController {
    
    return [self.viewControllers yj_safeIndexOfObject:viewController];
}

- (UIViewController *)yj_getFirstViewController {
    
    return [self.viewControllers yj_safeObjectAtIndex:0];
}

- (NSArray *)yj_popToViewControllerWithYJassName:(NSString *)YJassName
                                        animated:(BOOL)animated {
    
    return [self popToViewController:[self yj_findViewControllerWithYJassName:YJassName]
                            animated:animated];
}

- (NSArray *)yj_popToViewControllerWithLevel:(NSUInteger)level
                                    animated:(BOOL)animated {
    
    if (level == 0 || self.viewControllers.count < level) {
        
        return [self popToRootViewControllerAnimated:animated];
        
    } else {
        
        NSUInteger yj_index = self.viewControllers.count - level - 1;
        
        UIViewController *yj_viewController = self.viewControllers[yj_index];
        
        return [self popToViewController:yj_viewController
                                animated:animated];
    }
}

#pragma mark - 获取UINavigationBar的高度
- (CGFloat)yj_getNavigationBarHeight {
    
    return CGRectGetHeight(self.navigationBar.frame);
}

@end
