//
//  YJPickerController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"
#import "YJPickerToolView.h"
#import "YJPickerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJPickerController : YJViewController

/**
 只读的UIPickerView
 */
@property (nonatomic, strong, readonly) YJPickerView *yj_pickerView;

/**
 只读的YJPickerToolView
 */
@property (nonatomic, strong, readonly) YJPickerToolView *yj_pickerToolView;

/**
 是否展示YJPickerToolView, Default: NO
 */
@property (nonatomic, assign) BOOL yj_hiddenToolView;

/**
 UIPickerView Row Height
 */
@property (nonatomic, assign) CGFloat yj_pickerRowHeight;

/**
 初始化方法, 自带YJViewControllerTransitioningDelegate代理
 如需自定义, 可自行重写UIViewController TransitioningDelegate
 
 @param height Present Height
 @return YJPickerController
 */
- (instancetype)initPickerControllerWithHeight:(CGFloat)height;

/**
 设置UIPickerView的Delegate&DataSource
 
 @param delegate id<UIPickerViewDelegate>
 @param dataSource id<UIPickerViewDataSource>
 */
- (void)yj_setPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                      dataSource:(id<UIPickerViewDataSource>)dataSource;


@end

NS_ASSUME_NONNULL_END
