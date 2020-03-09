 
//  UITableView+YJTableView.h
//  SimpleProject
//
//  Created by Moyejin668 on 2018/1/20.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YJTableViewUpdateBlock)(UITableView *tableView);

@protocol YJTableViewPlaceholderDelegate <NSObject>

@required

/**
 设置一个UITableView占位图
 
 @return UIView
 */
- (UIView *)yj_placeholderView;

@optional

/**
 是否要计算UITableViewHeaderView的Frame
 
 @return BOOL
 */
- (BOOL)yj_calculateTableViewHeaderViewFrame;

/**
 出现占位图的时候是否允许滑动
 
 @return BOOL
 */
- (BOOL)yj_scrollEnabledWithShowPlaceholderView;

@end

@interface UITableView (YJTableView)

/**
 刷新并加载占位图
 */
- (void)yj_reloadData;

/**
 删除占位图
 */
- (void)yj_removePlaceholderViewWithSuperView;

#pragma mark - 刷新UITableView
/**
 刷新UITableView

 @param complete YJTableViewUpdateBlock
 */
- (void)yj_updateTableViewWithComplete:(YJTableViewUpdateBlock)complete;

#pragma mark - 操作UITableViewCell
/**
 滑动到屏幕显示的NSIndexPath

 @param indexPath NSIndexPath, 可为nil
 @param scrollPosition UITableViewScrollPosition
 @param animated BOOL
 */
- (void)yj_scrollToIndexPath:(NSIndexPath *)indexPath
              scrollPosition:(UITableViewScrollPosition)scrollPosition
                    animated:(BOOL)animated;

/**
 滑动到屏幕显示的Row, Section

 @param row NSUInteger
 @param section NSUInteger
 @param scrollPosition UITableViewScrollPosition
 @param animated BOOL
 */
- (void)yj_scrollToRow:(NSUInteger)row
               section:(NSUInteger)section
        scrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated;

#pragma mark - UITableView 插入操作
/**
 将指定的NSIndexPath插入UITableView

 @param indexPath NSIndexPath
 @param animation UITableViewRowAnimation
 */
- (void)yj_insertRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

/**
 将指定的Section插入UITableView

 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)yj_insertWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

/**
 将指定的Row和Section插入到UITableView

 @param row NSUInteger
 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)yj_insertWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

#pragma mark - UITableView 刷新操作
/**
 刷新指定的NSIndexPath

 @param indexPath NSIndexPath
 @param animation UITableViewRowAnimation
 */
- (void)yj_reloadRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

/**
 刷新指定的Section

 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)yj_reloadWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

/**
 刷新指定的Row和Section

 @param row NSUInteger
 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)yj_reloadWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

#pragma mark - UITableView 删除操作
/**
 删除UITableView指定的NSIndexPath

 @param indexPath NSIndexPath
 @param animation UITableViewRowAnimation
 */
- (void)yj_deleteRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

/**
 删除指定的Section

 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)yj_deleteWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

/**
 删除指定的Row和Section

 @param row NSUInteger
 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)yj_deleteWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

/**
 清理所有UITableViewCell被选中的状态

 @param animated BOOL
 */
- (void)yj_resetSelectedRowsAnimated:(BOOL)animated;

@end

