//
//  YJCollectionViewDropDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJCollectionViewDropDelegate.h"

@interface YJCollectionViewDropDelegate ()

@property (nonatomic, weak, readwrite) YJCollectionViewViewModel *yj_viewModel;

@end

@implementation YJCollectionViewDropDelegate

- (instancetype)initCollectionViewDropDelegateWithViewModel:(YJCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (void)collectionView:(nonnull UICollectionView *)collectionView
performDropWithCoordinator:(nonnull id<UICollectionViewDropCoordinator>)coordinator  API_AVAILABLE(ios(11.0)){
    
}

@end
