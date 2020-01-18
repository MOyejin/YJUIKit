//
//  YJViewControllerTransitioningDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJViewControllerViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJViewControllerTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>

/**
 只读的YJViewControllerViewModel
 */
@property (nonatomic, weak, readonly) YJViewController *yj_controller;

/**
 初始化YJViewControllerTransitioningDelegate
 
 @param controller YJViewController
 @return YJViewControllerTransitioningDelegate
 */
- (instancetype)initViewControllerTransitioningDelegateWithController:(YJViewController *)controller;


@end

NS_ASSUME_NONNULL_END
