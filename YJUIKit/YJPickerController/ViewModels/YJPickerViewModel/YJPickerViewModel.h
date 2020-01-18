//
//  YJPickerViewModel.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJPickerController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJPickerViewModel : NSObject


/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *yj_dataSource;

/**
 只读的YJPickerController
 */
@property (nonatomic, weak, readonly) YJPickerController *yj_pickerController;

/**
 初始化方法
 
 @param controller YJPickerController
 @return YJPickerViewModel
 */
- (instancetype)initPickerViewModelWithController:(YJPickerController *)controller;


@end

NS_ASSUME_NONNULL_END
