//
//  YJCollectionViewDropDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJCollectionViewDropDelegate : NSObject <UICollectionViewDropDelegate>

/**
 只读的YJCollectionViewViewModel
 */
@property (nonatomic, weak, readonly) YJCollectionViewViewModel *yj_viewModel;

/**
 YJCollectionViewDropDelegate自定义初始化
 
 @param viewModel YJCollectionViewViewModel
 @return self
 */
- (instancetype)initCollectionViewDropDelegateWithViewModel:(YJCollectionViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
