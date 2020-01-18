//
//  YJViewController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"

@interface YJViewController ()

@end

@implementation YJViewController

- (instancetype)initViewControllerWithType:(YJViewControllerType)type {
    
    self = [super init];
    
    if (self) {
        
        if (type == YJViewControllerTypeChild) {
            
            self.hidesBottomBarWhenPushed = YES;
        }
    }
    
    return self;
}

- (instancetype)initViewControllerWithTransitioningDelegate:(id<UIViewControllerTransitioningDelegate>)delegate {
    
    self = [super init];
    
    if (self) {
        
        self.transitioningDelegate = delegate;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
