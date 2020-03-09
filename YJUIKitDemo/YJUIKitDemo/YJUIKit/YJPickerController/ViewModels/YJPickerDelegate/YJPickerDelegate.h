//
//  YJPickerDelegate.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJPickerViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJPickerDelegate : NSObject <UIPickerViewDelegate>

/**
 只读YJPickerViewModel
 */
@property (nonatomic, weak, readonly) YJPickerViewModel *yj_viewModel;

/**
 初始化方法
 
 @param viewModel YJPickerViewModel
 @return YJPickerDelegate
 */
- (instancetype)initPickerDelegateWithViewModel:(YJPickerViewModel *)viewModel;


@end

NS_ASSUME_NONNULL_END
