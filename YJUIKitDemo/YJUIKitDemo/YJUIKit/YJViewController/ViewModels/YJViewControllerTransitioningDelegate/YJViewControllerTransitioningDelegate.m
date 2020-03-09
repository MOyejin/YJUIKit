//
//  YJViewControllerTransitioningDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewControllerTransitioningDelegate.h"

@interface YJViewControllerTransitioningDelegate ()

@property (nonatomic, weak, readwrite) YJViewController *yj_controller;

@end

@implementation YJViewControllerTransitioningDelegate

- (instancetype)initViewControllerTransitioningDelegateWithController:(YJViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.yj_controller = controller;
    }
    
    return self;
}

@end
