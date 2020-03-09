//
//  YJWebViewUIDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJWebViewUIDelegate.h"

@interface YJWebViewUIDelegate ()

@property (nonatomic, weak, readwrite) YJWebViewViewModel *yj_viewModel;

@end

@implementation YJWebViewUIDelegate

- (instancetype)initWebViewUIDelegateWithViewModel:(YJWebViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}


@end
