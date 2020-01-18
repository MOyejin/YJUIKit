 
//  UITableView+YJTableView.m
//  SimpleProject
//
//  Created by Moyejin668 on 2018/1/20.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UITableView+YJTableView.h"
#import <objc/runtime.h>

static void *YJPlaceholderView = &YJPlaceholderView;

@implementation UITableView (YJTableView)

#pragma mark - YJPlaceholderView
- (void)setYj_placeholderView:(UIView *)yj_placeholderView {
    
    objc_setAssociatedObject(self, YJPlaceholderView, yj_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)yj_placeholderView {
    
    return objc_getAssociatedObject(self, YJPlaceholderView);
}

- (void)yj_removePlaceholderViewWithSuperView {
    
    [self.yj_placeholderView removeFromSuperview];
    
    self.yj_placeholderView = nil;
}

#pragma mark - TableView Reload Data
- (void)yj_reloadData {
    
    [self reloadData];
    
    [self yj_checkEmpty];
}

#pragma mark - Check Empty
- (void)yj_checkEmpty {
    
    BOOL yj_isEmpty = YES;
    
    id<UITableViewDataSource> yj_dataSource = self.dataSource;
    
    NSInteger yj_sections = 1;
    
    if ([yj_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        
        yj_sections = [yj_dataSource numberOfSectionsInTableView:self];
    }
    
    for (int i = 0; i < yj_sections; ++i) {
        
        NSInteger rows = [yj_dataSource tableView:self
                            numberOfRowsInSection:i];
        
        if (rows) {
            
            yj_isEmpty = NO;
        }
    }
    
    if (!yj_isEmpty != !self.yj_placeholderView) {
        
        if (yj_isEmpty) {
            
            self.scrollEnabled = [self yj_responseScrollEnabledWithShowPlaceholderView];
            
            self.yj_placeholderView = [self yj_responseTableViewPlaceholderView];
            
            self.yj_placeholderView.frame = [self yj_responsePlaceholderViewFrame];
            
            [self addSubview:self.yj_placeholderView];
        } else {
            
            [self yj_removePlaceholderViewWithSuperView];
        }
        
    } else if (yj_isEmpty){
        
        self.scrollEnabled = [self yj_responseScrollEnabledWithShowPlaceholderView];
        
        [self.yj_placeholderView removeFromSuperview];
        
        [self addSubview:self.yj_placeholderView];
    }
}

#pragma mark - Response Delegate Method
- (UIView *)yj_responseTableViewPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(yj_placeholderView)]) {
        
        return [self.delegate performSelector:@selector(yj_placeholderView)];
        
    } else if ([self respondsToSelector:@selector(yj_placeholderView)]) {
        
        return [self performSelector:@selector(yj_placeholderView)];
    } else {
        
        return nil;
    }
}

#pragma mark - Response Delegate Method
- (BOOL)yj_responseScrollEnabledWithShowPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)]) {
        
        BOOL yj_scrollEnable = [[self.delegate performSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)] boolValue];
        
        return yj_scrollEnable;
        
    } else if ([self respondsToSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)]) {
        
        BOOL yj_scrollEnable = [[self performSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)] boolValue];
        
        return yj_scrollEnable;
        
    } else {
        
        return YES;
    }
}

#pragma mark - Response Placeholder View Frame
- (CGRect)yj_responsePlaceholderViewFrame {
    
    BOOL yj_selfHeaderViewResponse     = [self respondsToSelector:@selector(yj_calculateTableViewHeaderViewFrame)];
    BOOL yj_delegateHeaderViewResponse = [self.delegate respondsToSelector:@selector(yj_calculateTableViewHeaderViewFrame)];
    
    BOOL yj_tableHeaderViewResponse = self.tableHeaderView && (yj_selfHeaderViewResponse || yj_delegateHeaderViewResponse);
    
    if (yj_tableHeaderViewResponse) {
        
        CGFloat yj_placeholderViewY = CGRectGetHeight(self.tableHeaderView.frame);
        CGFloat yj_placeholderViewHeight = self.frame.size.height - CGRectGetHeight(self.tableHeaderView.frame);
        
        CGRect yj_placeholderViewFrame = CGRectMake(0, yj_placeholderViewY, CGRectGetWidth(self.frame), yj_placeholderViewHeight);
        
        return yj_placeholderViewFrame;
        
    } else {
        
        return CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
}

#pragma mark - 刷新UITableView
- (void)yj_updateTableViewWithComplete:(YJTableViewUpdateBlock)complete {
    
    [self beginUpdates];
    
    if (complete) {
        complete(self);
    }
    
    [self endUpdates];
}

#pragma mark - 操作UITableViewCell
- (void)yj_scrollToIndexPath:(NSIndexPath *)indexPath
              scrollPosition:(UITableViewScrollPosition)scrollPosition
                    animated:(BOOL)animated {
    
    [self scrollToRowAtIndexPath:indexPath
                atScrollPosition:scrollPosition
                        animated:animated];
}

- (void)yj_scrollToRow:(NSUInteger)row
               section:(NSUInteger)section
        scrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated {
    
    NSIndexPath *yj_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self yj_scrollToIndexPath:yj_indexPath
                scrollPosition:scrollPosition
                      animated:animated];
}

#pragma mark - UITableView 插入操作
- (void)yj_insertRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation {
    
    [self insertRowsAtIndexPaths:@[indexPath]
                withRowAnimation:animation];
}

- (void)yj_insertWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation {
    
    NSIndexSet *yj_indexSet = [NSIndexSet indexSetWithIndex:section];

    [self insertSections:yj_indexSet
        withRowAnimation:animation];
}

- (void)yj_insertWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation {
    
    NSIndexPath *yj_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self yj_insertRowWithIndexPath:yj_indexPath
                          animation:animation];
}

#pragma mark - UITableView 刷新操作
- (void)yj_reloadRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation {
    
    [self reloadRowsAtIndexPaths:@[indexPath]
                withRowAnimation:animation];
}

- (void)yj_reloadWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation {
    
    NSIndexSet *yj_indexSet = [NSIndexSet indexSetWithIndex:section];

    [self reloadSections:yj_indexSet
        withRowAnimation:animation];
}

- (void)yj_reloadWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation {
    
    NSIndexPath *yj_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self yj_reloadRowWithIndexPath:yj_indexPath
                          animation:animation];
}

#pragma mark - UITableView 删除相关
- (void)yj_deleteRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation {
    
    [self deleteRowsAtIndexPaths:@[indexPath]
                withRowAnimation:animation];
}

- (void)yj_deleteWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation {
    
    NSIndexSet *yj_indexSet = [NSIndexSet indexSetWithIndex:section];
    
    [self deleteSections:yj_indexSet
        withRowAnimation:animation];
}

- (void)yj_deleteWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation {
    
    NSIndexPath *yj_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self yj_deleteRowWithIndexPath:yj_indexPath
                          animation:animation];
}

- (void)yj_resetSelectedRowsAnimated:(BOOL)animated {
    
    NSArray *yj_indexArray = [self indexPathsForSelectedRows];
    
    [yj_indexArray enumerateObjectsUsingBlock:^(NSIndexPath *indxPath, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self deselectRowAtIndexPath:indxPath
                            animated:animated];
    }];
}

@end

