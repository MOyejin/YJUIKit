//
//  YJPickerDataSource.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerDataSource.h"

@interface YJPickerDataSource ()

@property (nonatomic, weak, readwrite) YJPickerViewModel *yj_viewModel;

@end

@implementation YJPickerDataSource

- (instancetype)initPickerDataSourceWithViewModel:(YJPickerViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    
    return self.yj_viewModel.yj_dataSource.count;
}


@end
