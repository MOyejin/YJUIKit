//
//  YJTableViewDataSource.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJTableViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJTableViewDataSource : NSObject <UITableViewDataSource>

/**
 只读的YJTableViewViewModel
 */
@property (nonatomic, weak, readonly) YJTableViewViewModel *yj_viewModel;

/**
 初始化YJTableViewDataSource
 
 @param viewModel YJTableViewViewModel
 @return self
 */
- (instancetype)initTableViewDataSourceWithViewModel:(YJTableViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
