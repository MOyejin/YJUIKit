//
//  YJWebViewController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJWebViewController : YJViewController

/**
 只读的WKWebView
 */
@property (nonatomic, strong, readonly) WKWebView *yj_webView;

/**
 设置WKWebView的WKUIDelegate于WKNavigationDelegate
 
 @param UIDelegate WKUIDelegate
 @param navigationDelegate WKNavigationDelegate
 */
- (void)yj_setWebViewUIDelegate:(_Nullable id <WKUIDelegate>)UIDelegate
             navigationDelegate:(_Nullable id <WKNavigationDelegate>)navigationDelegate;



@end

NS_ASSUME_NONNULL_END
