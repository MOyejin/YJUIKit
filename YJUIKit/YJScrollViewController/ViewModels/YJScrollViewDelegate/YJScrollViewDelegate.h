//
//  YJScrollViewDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJScrollViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJScrollViewDelegate : NSObject <UIScrollViewDelegate>

/**
 只读的YJScrollViewViewModel
 */
@property (nonatomic, weak, readonly) YJScrollViewViewModel *yj_scrollViewViewModel;

/**
 初始化YJScrollViewDelegate
 
 @param viewModel YJScrollViewViewModel
 @return self YJScrollViewDelegate
 */
- (instancetype)initScrollViewDelegateWithViewModel:(YJScrollViewViewModel *)viewModel;


@end

NS_ASSUME_NONNULL_END
