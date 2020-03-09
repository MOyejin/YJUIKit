//
//  YJWebViewViewModel.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJWebViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJWebViewViewModel : NSObject

/**
 只读的YJWebViewController
 */
@property (nonatomic, weak, readonly) YJWebViewController *yj_webViewController;

/**
 初始化YJWebViewViewModel
 
 @param controller YJWebViewController
 @return YJWebViewViewModel
 */
- (instancetype)initWebViewModelWithController:(YJWebViewController *)controller;


@end

NS_ASSUME_NONNULL_END
