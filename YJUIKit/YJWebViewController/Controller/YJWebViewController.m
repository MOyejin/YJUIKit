//
//  YJWebViewController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJWebViewController.h"

@interface YJWebViewController ()

@property (nonatomic, strong, readwrite) WKWebView *yj_webView;

@end

@implementation YJWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.yj_webView];
}

- (void)yj_setWebViewUIDelegate:(id<WKUIDelegate>)UIDelegate
             navigationDelegate:(id<WKNavigationDelegate>)navigationDelegate {
    
    self.yj_webView.UIDelegate         = UIDelegate;
    self.yj_webView.navigationDelegate = navigationDelegate;
}

- (WKWebView *)yj_webView {
    
    if (!_yj_webView) {
        
        _yj_webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    }
    
    return _yj_webView;
}

@end
