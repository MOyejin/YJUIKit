//
//  YJScrollViewViewModel.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJScrollViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJScrollViewViewModel : NSObject

/**
 只读的YJScrollViewController
 */
@property (nonatomic, weak, readonly) YJScrollViewController *yj_scrollViewController;

/**
 初始化YJScrollViewViewModel
 
 @param controller YJScrollViewController
 @return self YJScrollViewViewModel
 */
- (instancetype)initScrollViewDelegateWithController:(YJScrollViewController *)controller;

@end

NS_ASSUME_NONNULL_END
