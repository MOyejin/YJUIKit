//
//  YJTableViewDataSource.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTableViewDataSource.h"

@interface YJTableViewDataSource ()

@property (nonatomic, weak, readwrite) YJTableViewViewModel *yj_viewModel;

@end

@implementation YJTableViewDataSource

- (instancetype)initTableViewDataSourceWithViewModel:(YJTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.yj_viewModel.yj_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    return cell;
}


@end
