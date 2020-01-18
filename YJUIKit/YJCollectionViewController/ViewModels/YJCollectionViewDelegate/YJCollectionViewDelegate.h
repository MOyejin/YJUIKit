//
//  YJCollectionViewDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YJCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJCollectionViewDelegate : NSObject <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/**
 只读的YJCollectionViewViewModel
 */
@property (nonatomic, weak, readonly) YJCollectionViewViewModel *yj_viewModel;

/**
 YJCollectionViewViewModel自定义初始化
 
 @param viewModel YJCollectionViewViewModel
 @return self
 */
- (instancetype)initCollectionViewDelegateWithViewModel:(YJCollectionViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
