//
//  UIScrollView+YJScrollView.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/27.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YJScrollView)

/**
 移动到UIScrollView的最顶端

 @param animated BOOL
 */
- (void)yj_scrollViewToTopWithAnimated:(BOOL)animated;

/**
 移动到UIScrollView的最左边
 
 @param animated BOOL
 */
- (void)yj_scrollViewToLeftWithAnimated:(BOOL)animated;

/**
 移动到UIScrollView的最底端
 
 @param animated BOOL
 */
- (void)yj_scrollViewToBottomWithAnimated:(BOOL)animated;

/**
 移动到UIScrollView的最右边
 
 @param animated BOOL
 */
- (void)yj_scrollViewToRightWithAnimated:(BOOL)animated;

@end
