//
//  YJCollectionViewViewModel.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJCollectionViewViewModel : NSObject

/**
 数据源NSMutableArray
 */
@property (nonatomic, strong, readonly) NSMutableArray *yj_dataSource;

/**
 只读的YJCollectionViewController
 */
@property (nonatomic, weak, readonly) YJCollectionViewController *yj_collectionViewController;

/**
 YJCollectionViewViewModel自定义初始化
 
 @param viewController YJCollectionViewController
 @return self
 */
- (instancetype)initCollectionViewBaseModelWithController:(YJCollectionViewController *)viewController;

/**
 刷新UICollectionView的方法, 需要外部重载, 默认不实现任何东西
 */
- (void)yj_collectionViewHTTPRequest;


@end

NS_ASSUME_NONNULL_END
