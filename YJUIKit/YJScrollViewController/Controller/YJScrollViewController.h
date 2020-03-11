//
//  YJScrollViewController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJScrollViewController : YJViewController

/**
 获取UIScrollView, 只读
 */
@property (nonatomic, strong, readonly) UIScrollView *yj_scrollView;

/**
 设置UIScrollViewDelegate
 
 @param delegate id <UIScrollViewDelegate>
 */
- (void)yj_setScrollViewDelegate:(_Nullable id <UIScrollViewDelegate>)delegate;

/**
 隐藏ScrollView的Indicator
 */
- (void)yj_hiddenScrollIndicator;

@end

NS_ASSUME_NONNULL_END
