//
//  YJCollectionViewDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJCollectionViewDelegate.h"

@interface YJCollectionViewDelegate ()

@property (nonatomic, weak, readwrite) YJCollectionViewViewModel *yj_viewModel;

@end

@implementation YJCollectionViewDelegate

- (instancetype)initCollectionViewDelegateWithViewModel:(YJCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

@end
