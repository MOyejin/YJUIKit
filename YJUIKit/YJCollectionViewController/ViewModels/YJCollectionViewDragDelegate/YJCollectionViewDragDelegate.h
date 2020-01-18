//
//  YJCollectionViewDragDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJCollectionViewDragDelegate : NSObject <UICollectionViewDragDelegate>

/**
 只读的YJCollectionViewViewModel
 */
@property (nonatomic, weak, readonly) YJCollectionViewViewModel *yj_viewModel;

/**
 YJCollectionViewDragDelegate自定义初始化
 
 @param viewModel YJCollectionViewViewModel
 @return self
 */
- (instancetype)initCollectionViewDragDelegateWithViewModel:(YJCollectionViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
