//
//  YJWebViewViewModel.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJWebViewViewModel.h"

@interface YJWebViewViewModel ()

@property (nonatomic, weak, readwrite) YJWebViewController *yj_webViewController;

@end

@implementation YJWebViewViewModel

- (instancetype)initWebViewModelWithController:(YJWebViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.yj_webViewController = controller;
    }
    
    return self;
}

@end
