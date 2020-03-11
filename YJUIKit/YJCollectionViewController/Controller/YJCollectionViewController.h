//
//  YJCollectionViewController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJCollectionViewRefreshType) {
    YJCollectionViewRefreshTypeDropDown = 0,
    YJCollectionViewRefreshTypePullUp
};

@interface YJCollectionViewController : YJViewController

/**
 UICollectionView
 */
@property (nonatomic, strong, readonly) UICollectionView *yj_collectionView;

/**
 UICollectionViewFlowLayout, 默认不实现任何东西
 */
@property (nonatomic, strong, readonly) UICollectionViewFlowLayout *yj_collectionViewFlowLayout;

/**
 设置UICollectionView的代理与数据源
 
 @param delegate UICollectionViewDelegate
 @param dataSource UICollectionViewDataSource
 */
- (void)yj_setCollectionViewDelegate:(_Nullable id <UICollectionViewDelegate>)delegate
                          dataSource:(_Nullable id <UICollectionViewDataSource>)dataSource;

/**
 设置UICollectionView的拖拽代理与拖放代理
 
 @param dragDelegate UICollectionViewDragDelegate
 @param dropDelegate UICollectionViewDropDelegate
 */
- (void)yj_setCollectionViewDragDelegate:(_Nullable id <UICollectionViewDragDelegate>)dragDelegate
                            dropDelegate:(_Nullable id <UICollectionViewDropDelegate>)dropDelegate API_AVAILABLE(ios(11.0));

/**
 隐藏UICollectionView的ScrollIndicator
 */
- (void)yj_hiddenCollectionViewScrollIndicator;

/**
 给UICollectionView注册类
 
 @param cellClass Class
 @param identifier NSString
 */
- (void)yj_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier;

/**
 开始下拉刷新
 */
- (void)yj_dropDownBeginRefresh;

/**
 下拉刷新时调用的方法, 需要重载, 默认不实现任何东西
 */
- (void)yj_dropDownRefresh;

/**
 结束下拉刷新
 */
- (void)yj_dropDownEndRefresh;

/**
 开始上拉加载
 */
- (void)yj_pullUpBeginRefresh;

/**
 上拉加载时调用的方法, 需要重载, 默认不实现任何东西
 */
- (void)yj_pullUpRefresh;

/**
 结束上拉加载
 */
- (void)yj_pullUpEndRefresh;

/**
 选择指定的类型结束刷新
 
 @param refreshType YJCollectionViewRefreshType
 */
- (void)yj_endCollectionViewRefreshWithType:(YJCollectionViewRefreshType)refreshType;

/**
 删除下拉加载控件
 */
- (void)yj_removeHeaderRefresh;

/**
 删除上拉加载控件
 */
- (void)yj_removeFooterRefresh;

/**
 删除刷新控件
 */
- (void)yj_removeRefresh;

@end

NS_ASSUME_NONNULL_END
