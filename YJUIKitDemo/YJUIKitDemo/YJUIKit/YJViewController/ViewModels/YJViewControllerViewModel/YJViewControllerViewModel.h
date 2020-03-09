//
//  YJViewControllerViewModel.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJViewControllerViewModel : NSObject

/**
 只读的YJViewController
 */
@property (nonatomic, weak, readonly) YJViewController *yj_viewController;

/**
 初始化YJViewControllerViewModel
 
 @param controller YJViewController
 @return self
 */
- (instancetype)initViewControllerViewModelWithController:(YJViewController *)controller;


@end

NS_ASSUME_NONNULL_END
