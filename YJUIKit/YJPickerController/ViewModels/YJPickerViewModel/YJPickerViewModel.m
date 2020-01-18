//
//  YJPickerViewModel.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerViewModel.h"

@interface YJPickerViewModel ()

@property (nonatomic, weak, readwrite) YJPickerController *yj_pickerController;

@end

@implementation YJPickerViewModel

- (instancetype)initPickerViewModelWithController:(YJPickerController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.yj_pickerController = controller;
    }
    
    return self;
}

- (NSMutableArray *)yj_dataSource {
    
    if (!_yj_dataSource) {
        
        _yj_dataSource = [NSMutableArray array];
    }
    
    return _yj_dataSource;
}


@end
