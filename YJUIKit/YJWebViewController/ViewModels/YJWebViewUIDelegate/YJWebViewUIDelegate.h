//
//  YJWebViewUIDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "YJWebViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJWebViewUIDelegate : NSObject <WKUIDelegate>

/**
 只读的YJWebViewViewModel
 */
@property (nonatomic, weak, readonly) YJWebViewViewModel *yj_viewModel;

/**
 初始化YJWebViewUIDelegate
 
 @param viewModel YJWebViewViewModel
 @return YJWebViewUIDelegate
 */
- (instancetype)initWebViewUIDelegateWithViewModel:(YJWebViewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
