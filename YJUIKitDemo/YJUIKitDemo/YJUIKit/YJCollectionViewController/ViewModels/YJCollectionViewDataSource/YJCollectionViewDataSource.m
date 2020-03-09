//
//  YJCollectionViewDataSource.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJCollectionViewDataSource.h"

@interface YJCollectionViewDataSource ()

@property (nonatomic, weak, readwrite) YJCollectionViewViewModel *yj_viewModel;

@end

@implementation YJCollectionViewDataSource

- (instancetype)initCollectionViewDataSourceWithViewModel:(YJCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return self.yj_viewModel.yj_dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell"
                                                                           forIndexPath:indexPath];
    
    return cell;
}

@end
