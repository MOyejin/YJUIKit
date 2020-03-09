//
//  YJViewController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJViewControllerType) {
    
    YJViewControllerTypeMain = 0, // Default
    YJViewControllerTypeChild
};

@interface YJViewController : UIViewController

/**
 初始化YJViewController, 默认为YJViewControllerTypeMain
 
 @param type YJViewControllerStyle
 @return self
 */
- (instancetype)initViewControllerWithType:(YJViewControllerType)type;

/**
 初始化YJViewController, 并输入指定的UIViewControllerTransitioningDelegate代理
 
 @param delegate id<UIViewControllerTransitioningDelegate>
 @return YJViewController
 */
- (instancetype)initViewControllerWithTransitioningDelegate:(id<UIViewControllerTransitioningDelegate>)delegate;


@end

NS_ASSUME_NONNULL_END
