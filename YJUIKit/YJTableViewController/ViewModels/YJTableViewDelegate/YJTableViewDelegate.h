//
//  YJTableViewDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YJTableViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJTableViewDelegate : NSObject <UITableViewDelegate>

/**
 只读的YJTableViewViewModel
 */
@property (nonatomic, weak, readonly) YJTableViewViewModel *yj_viewModel;

/**
 初始化YJTableViewDelegate
 
 @param viewModel YJTableViewViewModel
 @return self
 */
- (instancetype)initTableViewDelegateWithViewModel:(YJTableViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
