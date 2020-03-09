//
//  YJWebViewNavigationDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJWebViewNavigationDelegate.h"

@interface YJWebViewNavigationDelegate ()

@property (nonatomic, weak, readwrite) YJWebViewViewModel *yj_viewModel;

@end

@implementation YJWebViewNavigationDelegate

- (instancetype)initWebViewNavigationDelegateWithViewModel:(YJWebViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}


@end
