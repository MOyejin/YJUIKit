//
//  YJTableViewViewModel.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJTableViewViewModel : NSObject

/**
 数据源NSArray
 */
@property (nonatomic, strong, readonly) NSMutableArray *yj_dataSource;

/**
 只读的YJTableViewController
 */
@property (nonatomic, weak, readonly) YJTableViewController *yj_tableViewController;

/**
 初始化YJTableViewViewModel
 
 @param viewController YJTableViewController
 @return self
 */
- (instancetype)initTableViewBaseModelWithController:(YJTableViewController *)viewController;

/**
 通过HTTP请求数据
 */
- (void)yj_tableViewHTTPRequest;

/**
 配置TableView每一条Cell所显示的分割线
 */
- (void)yj_showTableViewSeparatorLine;

@end

NS_ASSUME_NONNULL_END
