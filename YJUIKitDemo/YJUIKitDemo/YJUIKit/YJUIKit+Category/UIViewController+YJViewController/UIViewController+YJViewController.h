 
//  UIViewController+YJViewController.h
//
//  Created by  MOyejin668 on 2016/12/1.
//  Copyright © 2016年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YJAlertControlAction)(UIAlertAction *action, NSUInteger index);

@protocol YJNavigationControllerBackItemProtocol <NSObject>
@optional

/**
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)yj_navigationShouldPopOnBackButton;

@end

@interface UIViewController (YJViewController) <YJNavigationControllerBackItemProtocol>

/**
 设置Modal转场动画时的UIViewController高度
 */
@property (assign, nonatomic) CGFloat yj_presentationViewHeight;

/**
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)yj_navigationShouldPopOnBackButton;

/**
 设置UINavigationBar是否透明
 
 @param bools BOOL
 */
- (void)yj_setNavigationBarTranslucentWithBOOL:(BOOL)bools;

/**
 设置UITabBar是否透明
 
 @param bools BOOL
 */
- (void)yj_setTabBarTranslucentWithBOOL:(BOOL)bools;

/**
 设置当前UIViewController的UINavigationBar是否可以右滑返回

 @param enabled BOOL
 */
- (void)yj_setNavigationBarInteractivePopGestureRecognizerWithEnabled:(BOOL)enabled;

#pragma mark - 呼叫手机
/**
 呼叫手机号
 
 @param phoneNumber NSString
 @param title NSString
 */
- (void)yj_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title;

#pragma mark - UIAlertController自定义
/**
 调用UIAlertController, UIAlertControllerStyleAlert样式
 
 @param title NSString
 @param message NSString
 */
- (void)yj_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle;

/**
 调用UIAlertController, UIAlertControllerStyleActionSheet样式
 
 @param title NSString
 @param message NSString
 @param actionTitles NSArray<NSString *>
 @param complete UIAlertAction响应事件
 */
- (void)yj_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(YJAlertControlAction)complete;

/**
 调用UIAlertController, UIAlertControllerStyleAlert样式

 @param title NSString
 @param message NSString
 @param actionTitles NSArray<NSString *>
 @param complete UIAlertAction响应事件
 */
- (void)yj_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(YJAlertControlAction)complete;

/**
 自定义调用UIAlertController
 
 @param title NSString
 @param message NSString
 @param actions NSArray<NSString *>
 @param preferredStyle UIAlertControllerStyle
 */
- (void)yj_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *)actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle;

@end
