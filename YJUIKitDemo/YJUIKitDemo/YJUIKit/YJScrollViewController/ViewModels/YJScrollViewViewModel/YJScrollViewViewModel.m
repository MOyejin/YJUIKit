//
//  YJScrollViewViewModel.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJScrollViewViewModel.h"

@interface YJScrollViewViewModel ()

@property (nonatomic, weak, readwrite) YJScrollViewController *yj_scrollViewController;

@end

@implementation YJScrollViewViewModel

- (instancetype)initScrollViewDelegateWithController:(YJScrollViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.yj_scrollViewController = controller;
    }
    
    return self;
}


@end
