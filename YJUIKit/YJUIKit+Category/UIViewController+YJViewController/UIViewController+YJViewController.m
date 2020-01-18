 
//  UIViewController+YJViewController.m
//
//  Created by  MOyejin668 on 2016/12/1.
//  Copyright © 2016年 Moyejin668. All rights reserved.
//

#import "UIViewController+YJViewController.h"
#import <objc/runtime.h>

#import "UIApplication+YJApplication.h"

static void *AlertControllerKey = &AlertControllerKey;

@implementation UIViewController (YJViewController)

- (void)setYj_presentationViewHeight:(CGFloat)yj_presentationViewHeight {
    objc_setAssociatedObject(self, @"height", @(yj_presentationViewHeight), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)yj_presentationViewHeight {
    return [objc_getAssociatedObject(self, @"height") floatValue];
}

- (BOOL)yj_navigationShouldPopOnBackButton {
    
    return YES;
}

- (void)yj_setNavigationBarTranslucentWithBOOL:(BOOL)bools {
    self.navigationController.navigationBar.translucent = bools;
}

- (void)yj_setTabBarTranslucentWithBOOL:(BOOL)bools {
    self.tabBarController.tabBar.translucent = bools;
}

- (void)yj_setNavigationBarInteractivePopGestureRecognizerWithEnabled:(BOOL)enabled {
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = enabled;
    }
}

#pragma mark - AlertController
- (void)setYj_alertController:(UIAlertController *)yj_alertController {
    
    objc_setAssociatedObject(self, AlertControllerKey, yj_alertController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIAlertController *)yj_alertController {
    
    return objc_getAssociatedObject(self, AlertControllerKey);
}

#pragma mark - 呼叫手机
- (void)yj_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title {
    
    UIAlertAction *yj_cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction *action) {}];
    
    UIAlertAction *yj_otherAction = [UIAlertAction actionWithTitle:@"呼叫"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                               
                                                               [UIApplication yj_callPhoneWithPhoneNumber:phoneNumber];
                                                           }];
    
    [self yj_showAlertViewControllerWithTitle:title
                                      message:[NSString stringWithFormat:@"%@%@", message, phoneNumber]
                                      actions:@[yj_cancelAction, yj_otherAction]
                               preferredStyle:UIAlertControllerStyleAlert];
}

#pragma mark - UIAlertController自定义
- (void)yj_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle {
    
    UIAlertAction *yj_otherAction = [UIAlertAction actionWithTitle:buttonTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                           }];
    
    [self yj_showAlertViewControllerWithTitle:title
                                      message:message
                                      actions:@[yj_otherAction]
                               preferredStyle:UIAlertControllerStyleAlert];
}

- (void)yj_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(YJAlertControlAction)complete {
    
    UIAlertController *yj_alertController = [UIAlertController alertControllerWithTitle:title
                                                                                message:message
                                                                         preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *yj_alertAction = [UIAlertAction actionWithTitle:obj
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   
                                                                   if (complete) {
                                                                       
                                                                       complete(action, idx);
                                                                   }
                                                               }];
        
        [yj_alertController addAction:yj_alertAction];
    }];
    
    UIAlertAction *yj_cancelAlertAction = [UIAlertAction actionWithTitle:@"取消"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
    
    [yj_alertController addAction:yj_cancelAlertAction];
    
    [self presentViewController:yj_alertController
                       animated:YES
                     completion:nil];
}

- (void)yj_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(YJAlertControlAction)complete {
    
    UIAlertController *yj_alertController = [UIAlertController alertControllerWithTitle:title
                                                                                message:message
                                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *yj_alertAction = [UIAlertAction actionWithTitle:obj
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   
                                                                   if (complete) {
                                                                       
                                                                       complete(action, idx);
                                                                   }
                                                               }];
        
        [yj_alertController addAction:yj_alertAction];
    }];
    
    [self presentViewController:yj_alertController
                       animated:YES
                     completion:nil];
}

- (void)yj_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *) actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    UIAlertController *yj_alertController = [UIAlertController alertControllerWithTitle:title
                                                                                message:message
                                                                         preferredStyle:preferredStyle];
    
    if (actions) {
        
        for (UIAlertAction *yj_alertAction in actions) {
            
            [yj_alertController addAction:yj_alertAction];
        }
    }
    
    [self presentViewController:yj_alertController
                       animated:YES
                     completion:nil];
}

@end

@implementation UINavigationController (YJNavigaionController)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar
        shouldPopItem:(UINavigationItem *)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL yj_shouldPop = YES;
    
    UIViewController *yj_viewController = [self topViewController];
    
    if([yj_viewController respondsToSelector:@selector(yj_navigationShouldPopOnBackButton)]) {
        
        yj_shouldPop = [yj_viewController yj_navigationShouldPopOnBackButton];
    }
    
    if(yj_shouldPop) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
        
    } else {
        
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *yj_subview in [navigationBar subviews]) {
            
            if(0.f < yj_subview.alpha && yj_subview.alpha < 1.0) {
                
                [UIView animateWithDuration:0.25
                                 animations:^{
                                     
                                     yj_subview.alpha = 1.0f;
                                 }];
            }
        }
    }
    
    return NO;
}

@end
