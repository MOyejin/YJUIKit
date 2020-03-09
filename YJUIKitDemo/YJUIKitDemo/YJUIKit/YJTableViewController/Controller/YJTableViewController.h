//
//  YJTableViewController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJTableViewRefreshType) {
    YJTableViewRefreshTypeDropDown = 0,
    YJTableViewRefreshTypePullUp
};

@interface YJTableViewController : YJViewController

/**
只读的UITableView
*/
@property (nonatomic, strong, readonly) UITableView *yj_tableView;

/**
 初始化YJTableViewController
 
 @param style UITableViewStyle, 默认是UITableViewStylePlain
 @return YJTableViewController
 */
- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style;

/**
 设置UITableView的代理与数据源
 
 @param delegate UITableViewDelegate
 @param dataSource UITableViewDataSource
 */
- (void)yj_setTableViewDelegate:(_Nullable id <UITableViewDelegate>)delegate
                     dataSource:(_Nullable id <UITableViewDataSource>)dataSource;


/**
 设置UITableView的拖拽代理与拖放代理
 
 @param dragDelegate UITableViewDragDelegate
 @param dropDelegate UITableViewDropDelegate
 */
- (void)yj_setTableViewDragDelegate:(_Nullable id <UITableViewDragDelegate>)dragDelegate
                       dropDelegate:(_Nullable id <UITableViewDropDelegate>)dropDelegate API_AVAILABLE(ios(11.0));

/**
 隐藏UITableView的ScrollIndicator
 */
- (void)yj_hiddenTableViewScrollIndicator;

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
 
 @param refreshType YJTableViewRefreshType
 */
- (void)yj_endTableViewRefreshWithType:(YJTableViewRefreshType)refreshType;

/**
 删除头部MJRefresh
 */
- (void)yj_removeHeaderRefresh;

/**
 删除尾部MJRefresh
 */
- (void)yj_removeFooterRefresh;

/**
 删除MJRefresh
 */
- (void)yj_removeRefresh;

/**
 隐藏MJRefreshHeader的StateLabel与TimeLabel
 */
- (void)yj_hiddenRefreshStateOrLastTimeLabel;

/**
 隐藏MJRefreshHeader与MJRefreshFooter的StateLabel
 */
- (void)yj_hiddenRefreshStateLabel;

/**
 隐藏MJRefreshHeader的StateLabel
 */
- (void)yj_hiddenHeaderRefreshStateLabel;

/**
 隐藏MJRefreshFooter的StateLabel
 */
- (void)yj_hiddenFooterRefreshStateLabel;

/**
 隐藏MJRefreshHeader的LastTimeLabel
 */
- (void)yj_hiddenHeaderRefreshLastTimeLabel;


@end

NS_ASSUME_NONNULL_END
