//
//  UINavigationController+YJNavigationController.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/27.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (YJNavigationController)

/**
 获取指定类名的UIViewController

 @param YJassName NSString
 @return UIViewController
 */
- (UIViewController *)yj_findViewControllerWithYJassName:(NSString *)YJassName;

/**
 获取UIViewController的索引

 @param viewController UIViewController
 @return NSUInteger
 */
- (NSUInteger)yj_getIndexWithViewController:(UIViewController *)viewController;

/**
 获取UINavigationController的FirstViewController

 @return UIViewController
 */
- (UIViewController *)yj_getFirstViewController;

/**
 Pop到指定类名的UIViewController

 @param YJassName NSString
 @return NSArray
 */
- (NSArray *)yj_popToViewControllerWithYJassName:(NSString *)YJassName
                                        animated:(BOOL)animated;

/**
 Pop到指定层级的UIViewController

 @param level NSUInteger
 @param animated BOOL
 @return NSArray
 */
- (NSArray *)yj_popToViewControllerWithLevel:(NSUInteger)level
                                    animated:(BOOL)animated;

/**
 获取UINavigationBar的高度
 
 @return CGFloat
 */
- (CGFloat)yj_getNavigationBarHeight;

@end
