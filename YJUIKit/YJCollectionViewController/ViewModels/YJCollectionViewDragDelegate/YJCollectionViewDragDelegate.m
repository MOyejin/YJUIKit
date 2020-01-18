//
//  YJCollectionViewDragDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJCollectionViewDragDelegate.h"

@interface YJCollectionViewDragDelegate ()

@property (nonatomic, weak, readwrite) YJCollectionViewViewModel *yj_viewModel;

@end

@implementation YJCollectionViewDragDelegate

- (instancetype)initCollectionViewDragDelegateWithViewModel:(YJCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (nonnull NSArray<UIDragItem *> *)collectionView:(nonnull UICollectionView *)collectionView
                     itemsForBeginningDragSession:(nonnull id<UIDragSession>)session
                                      atIndexPath:(nonnull NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)) {
    
    return nil;
}


@end
