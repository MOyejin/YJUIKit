 
//  UICollectionView+YJCollectionView.h
//  SimpleProject
//
//  Created by Moyejin668 on 2018/1/21.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJCollectionViewPlaceholderDelegate <NSObject>

@required

/**
 设置一个UICollectionView占位图
 
 @return UIView
 */
- (UIView *)yj_placeholderView;

@optional

/**
 出现占位图的时候是否允许滑动
 
 @return BOOL
 */
- (BOOL)yj_scrollEnabledWithShowPlaceholderView;

@end

@interface UICollectionView (YJCollectionView)

/**
 刷新并加载占位图
 */
- (void)yj_reloadData;

/**
 删除占位图
 */
- (void)yj_removePlaceholderViewWithSuperView;

@end
