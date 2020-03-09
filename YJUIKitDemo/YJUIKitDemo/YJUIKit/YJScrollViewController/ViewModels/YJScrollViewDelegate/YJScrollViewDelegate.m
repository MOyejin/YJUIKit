//
//  YJScrollViewDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJScrollViewDelegate.h"

@interface YJScrollViewDelegate ()

@property (nonatomic, weak, readwrite) YJScrollViewViewModel *yj_scrollViewViewModel;

@end

@implementation YJScrollViewDelegate

- (instancetype)initScrollViewDelegateWithViewModel:(YJScrollViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_scrollViewViewModel = viewModel;
    }
    
    return self;
}

@end
