//
//  YJWebViewNavigationDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "YJWebViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJWebViewNavigationDelegate : NSObject <WKNavigationDelegate>

/**
 只读的YJWebViewViewModel
 */
@property (nonatomic, weak, readonly) YJWebViewViewModel *yj_viewModel;

/**
 初始化YJWebViewNavigationDelegate
 
 @param viewModel YJWebViewViewModel
 @return YJWebViewNavigationDelegate
 */
- (instancetype)initWebViewNavigationDelegateWithViewModel:(YJWebViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
