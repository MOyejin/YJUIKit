//
//  YJTableViewController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTableViewController.h"
#import "MJRefresh/MJRefresh.h"//依赖的第三方库

@interface YJTableViewController ()

@property (nonatomic, assign           ) UITableViewStyle          tableViewStyle;

@property (nonatomic, strong, readwrite) UITableView               *yj_tableView;

@property (nonatomic, strong           ) MJRefreshNormalHeader     *yj_refreshHeader;
@property (nonatomic, strong           ) MJRefreshBackNormalFooter *yj_refreshFooter;


@end

@implementation YJTableViewController

- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style {
    
    self = [super init];
    
    if (self) {
        
        [self setTableViewStyle:style];
    }
    
    return self;
}

#pragma mark - View Did Load
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.yj_tableView];
    [self yj_addRefresh];
}

#pragma mark - 设置Delegate与DataSource
- (void)yj_setTableViewDelegate:(id<UITableViewDelegate>)delegate
                     dataSource:(id<UITableViewDataSource>)dataSource {
    
    self.yj_tableView.delegate   = delegate;
    self.yj_tableView.dataSource = dataSource;
}

#pragma mark - 设置DragDelegate与DropDelegate
- (void)yj_setTableViewDragDelegate:(id<UITableViewDragDelegate>)dragDelegate
                       dropDelegate:(id<UITableViewDropDelegate>)dropDelegate {
    
    self.yj_tableView.dragDelegate = dragDelegate;
    self.yj_tableView.dropDelegate = dropDelegate;
}

#pragma mark - 隐藏UITableView的ScrollIndicator
- (void)yj_hiddenTableViewScrollIndicator {
    
    self.yj_tableView.showsVerticalScrollIndicator   = NO;
    self.yj_tableView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - MJRefresh相关
- (void)yj_addRefresh {
    
    self.yj_tableView.mj_header = self.yj_refreshHeader;
    self.yj_tableView.mj_footer = self.yj_refreshFooter;
}

- (MJRefreshNormalHeader *)yj_refreshHeader {
    __weak typeof(self) weakSelf = self;
    
    if (!_yj_refreshHeader) {
        
        _yj_refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf yj_dropDownRefresh];
        }];
    }
    
    return _yj_refreshHeader;
}

- (MJRefreshBackNormalFooter *)yj_refreshFooter {
    
    __weak typeof(self) weakSelf = self;
    
    if (!_yj_refreshFooter) {
        
        _yj_refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf yj_pullUpRefresh];
        }];
    }
    
    return _yj_refreshFooter;
}

#pragma mark - 下拉刷新相关
- (void)yj_dropDownBeginRefresh {
    [self.yj_tableView.mj_header beginRefreshing];
}

- (void)yj_dropDownRefresh {}

- (void)yj_dropDownEndRefresh {
    [self.yj_tableView.mj_header endRefreshing];
}

#pragma mark - 上拉刷新相关
- (void)yj_pullUpBeginRefresh {
    [self.yj_tableView.mj_footer beginRefreshing];
}

- (void)yj_pullUpRefresh {}

- (void)yj_pullUpEndRefresh {
    [self.yj_tableView.mj_footer endRefreshing];
}

- (void)yj_endTableViewRefreshWithType:(YJTableViewRefreshType)refreshType {
    
    if (refreshType == YJTableViewRefreshTypeDropDown) {
        
        [self yj_dropDownEndRefresh];
    } else {
        [self yj_pullUpEndRefresh];
    }
}

#pragma mark - 移除MJRefresh
- (void)yj_removeHeaderRefresh {
    self.yj_tableView.mj_header = nil;
}

- (void)yj_removeFooterRefresh {
    self.yj_tableView.mj_footer = nil;
}

- (void)yj_removeRefresh {
    
    self.yj_tableView.mj_header = nil;
    self.yj_tableView.mj_footer = nil;
}

/**
 隐藏MJRefreshHeader的StateLabel与TimeLabel
 */
- (void)yj_hiddenRefreshStateOrLastTimeLabel {
    
    [self yj_hiddenRefreshStateLabel];
    [self yj_hiddenHeaderRefreshLastTimeLabel];
}

/**
 隐藏MJRefreshHeader与MJRefreshFooter的StateLabel
 */
- (void)yj_hiddenRefreshStateLabel {
    
    [self yj_hiddenHeaderRefreshStateLabel];
    [self yj_hiddenFooterRefreshStateLabel];
}

/**
 隐藏MJRefreshHeader的StateLabel
 */
- (void)yj_hiddenHeaderRefreshStateLabel {
    
    self.yj_refreshHeader.stateLabel.hidden = YES;
}

/**
 隐藏MJRefreshFooter的StateLabel
 */
- (void)yj_hiddenFooterRefreshStateLabel {
    
    self.yj_refreshFooter.stateLabel.hidden = YES;
}

/**
 隐藏MJRefreshHeader的LastTimeLabel
 */
- (void)yj_hiddenHeaderRefreshLastTimeLabel {
    
    self.yj_refreshHeader.lastUpdatedTimeLabel.hidden = YES;
}

#pragma mark - 懒加载
- (UITableView *)yj_tableView {
    
    if (!_yj_tableView) {
        
        _yj_tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                     style:self.tableViewStyle];
        
        if (self.tableViewStyle == UITableViewStylePlain) {
            
            _yj_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
    }
    
    return _yj_tableView;
}

@end
