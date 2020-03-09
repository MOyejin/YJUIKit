//
//  YJTableViewDropDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTableViewDropDelegate.h"

@interface YJTableViewDropDelegate ()

@property (nonatomic, weak, readwrite) YJTableViewViewModel *yj_viewModel;

@end

@implementation YJTableViewDropDelegate

- (instancetype)initTableViewDropDelegateWithViewModel:(YJTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (void)tableView:(nonnull UITableView *)tableView
performDropWithCoordinator:(nonnull id<UITableViewDropCoordinator>)coordinator  API_AVAILABLE(ios(11.0)) {
    
}


@end
