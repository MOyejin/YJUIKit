//
//  YJPickerDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerDelegate.h"

@interface YJPickerDelegate ()

@property (nonatomic, weak) YJPickerViewModel *yj_viewModel;

@end

@implementation YJPickerDelegate

- (instancetype)initPickerDelegateWithViewModel:(YJPickerViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
rowHeightForComponent:(NSInteger)component {
    
    return self.yj_viewModel.yj_pickerController.yj_pickerRowHeight;
}


@end
