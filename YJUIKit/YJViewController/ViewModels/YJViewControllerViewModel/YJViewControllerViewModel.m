//
//  YJViewControllerViewModel.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewControllerViewModel.h"

@interface YJViewControllerViewModel ()

@property (nonatomic, weak, readwrite) YJViewController *yj_viewController;

@end

@implementation YJViewControllerViewModel

- (instancetype)initViewControllerViewModelWithController:(YJViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewController = controller;
    }
    
    return self;
}


@end
