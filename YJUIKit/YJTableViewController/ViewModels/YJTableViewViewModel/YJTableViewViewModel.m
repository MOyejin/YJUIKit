//
//  YJTableViewViewModel.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTableViewViewModel.h"

@interface YJTableViewViewModel()

@property (nonatomic, strong, readwrite) NSMutableArray *yj_dataSource;

@property (nonatomic, weak, readwrite) YJTableViewController *yj_tableViewController;

@end

@implementation YJTableViewViewModel

- (instancetype)initTableViewBaseModelWithController:(YJTableViewController *)viewController {
    
    self = [super init];
    
    if (self) {
        self.yj_tableViewController = viewController;
    }
    
    return self;
}

- (NSMutableArray *)yj_dataSource {
    
    if (!_yj_dataSource) {
        
        _yj_dataSource = [NSMutableArray array];
    }
    
    return _yj_dataSource;
}

- (void)yj_tableViewHTTPRequest {
    
}

- (void)yj_showTableViewSeparatorLine {
    
    if (self.yj_dataSource.count > 0) {
        
        self.yj_tableViewController.yj_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}


@end
