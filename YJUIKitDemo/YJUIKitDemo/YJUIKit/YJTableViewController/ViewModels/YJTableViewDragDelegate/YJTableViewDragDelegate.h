//
//  YJTableViewDragDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJTableViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJTableViewDragDelegate : NSObject <UITableViewDragDelegate>

/**
 只读的YJTableViewViewModel
 */
@property (nonatomic, weak, readonly) YJTableViewViewModel *yj_viewModel;

/**
 初始化YJTableViewDragDelegate
 
 @param viewModel YJTableViewViewModel
 @return self
 */
- (instancetype)initTableViewDragDelegateWithViewModel:(YJTableViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
