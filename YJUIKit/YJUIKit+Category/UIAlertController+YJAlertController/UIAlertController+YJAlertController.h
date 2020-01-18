//
//  UIAlertController+YJAlertController.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2019/1/22.
//  Copyright © 2019 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+YJViewController.h"

@interface UIAlertController (YJAlertController)

/**
 添加UIAlertActionStyleCancel的UIAlertAction

 @param actionTitle NSString
 @param complete YJAlertControlAction
 */
- (void)yj_addCancelAlertActionWithActionTitle:(NSString *)actionTitle
                                      complete:(YJAlertControlAction)complete;

/**
 快速添加UIAlertController的UIAlertAction

 @param actionTitles NSArray<NSString *> *，数据中的元素至少是非空值
 @param complete YJAlertControlAction
 */
- (void)yj_addAlertActionWithActionTitles:(NSArray<NSString *> *)actionTitles
                                 complete:(YJAlertControlAction)complete;

/**
 UIAlertControllerStyleAlert样式的UIAlertController

 @param title NSString
 @param message NSString
 @param actionTitle NSString
 @return UIAlertController
 */
+ (UIAlertController *)yj_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           actionTitle:(NSString *)actionTitle;

/**
 UIAlertControllerStyleAlert样式的UIAlertController

 @param title NSString
 @param message NSString
 @param cancelTitle NSString
 @param actionTitles NSArray<NSString *> *
 @param complete YJAlertControlAction
 @return UIAlertController
 */
+ (UIAlertController *)yj_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(YJAlertControlAction)complete;

/**
 UIAlertControllerStyleActionSheet样式的UIAlertController

 @param title NSString
 @param message NSString
 @param cancelTitle NSString
 @param actionTitles NSArray<NSString *> *
 @param complete YJAlertControlAction
 @return UIAlertController
 */
+ (UIAlertController *)yj_showSheetControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(YJAlertControlAction)complete;

/**
 可自定义的UIAlertController API

 @param title NSString
 @param message NSString
 @param cancelTitle NSString
 @param actionTitles NSArray<NSString *> *
 @param preferredStyle UIAlertControllerStyle
 @param complete YJAlertControlAction
 @return UIAlertController
 */
+ (UIAlertController *)yj_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                              complete:(YJAlertControlAction)complete;

@end
