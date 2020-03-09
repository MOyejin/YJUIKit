//
//  YJTableViewDragDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTableViewDragDelegate.h"

@interface YJTableViewDragDelegate ()

@property (nonatomic, weak, readwrite) YJTableViewViewModel *yj_viewModel;

@end

@implementation YJTableViewDragDelegate

- (instancetype)initTableViewDragDelegateWithViewModel:(YJTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (nonnull NSArray<UIDragItem *> *)tableView:(nonnull UITableView *)tableView
                itemsForBeginningDragSession:(nonnull id<UIDragSession>)session
                                 atIndexPath:(nonnull NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)) {
    
    return nil;
}

@end
