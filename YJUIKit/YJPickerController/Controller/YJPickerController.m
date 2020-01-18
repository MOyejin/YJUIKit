//
//  YJPickerController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerController.h"
#import "YJPickerTransitioningDelegate.h"
#import "UIViewController+YJViewController.h"


@interface YJPickerController ()

@property (nonatomic, strong) YJPickerTransitioningDelegate *yj_pickerTransitioningDelegate;

@property (nonatomic, strong, readwrite) YJPickerView     *yj_pickerView;
@property (nonatomic, strong, readwrite) YJPickerToolView *yj_pickerToolView;


@end

@implementation YJPickerController

- (instancetype)initPickerControllerWithHeight:(CGFloat)height {
    
    self = [super init];
    
    if (self) {
        
        self.transitioningDelegate     = self.yj_pickerTransitioningDelegate;
        self.modalPresentationStyle    = UIModalPresentationCustom;
        
        if (height == 0) {
            
            height = 264;
        }
        
        self.yj_presentationViewHeight = height;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.yj_pickerView];
    [self.view addSubview:self.yj_pickerToolView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self yj_addConstraintsWithSuperView];
}

- (YJPickerView *)yj_pickerView {
    
    if (!_yj_pickerView) {
        
        CGFloat yj_pickerViewH = self.yj_presentationViewHeight - CGRectGetHeight(self.yj_pickerToolView.frame);
        
        _yj_pickerView = [[YJPickerView alloc] initWithFrame:CGRectMake(0,
                                                                        CGRectGetMaxY(self.yj_pickerToolView.frame),
                                                                        CGRectGetWidth(self.view.frame),
                                                                        yj_pickerViewH)];
        
        _yj_pickerView.showsSelectionIndicator = YES;
    }
    
    return _yj_pickerView;
}

- (YJPickerToolView *)yj_pickerToolView {
    
    if(!_yj_pickerToolView) {
        
        CGFloat yj_pickerToolViewH = self.yj_hiddenToolView ? 0 : 44;
        
        _yj_pickerToolView = [[YJPickerToolView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), yj_pickerToolViewH)];
        
        _yj_pickerToolView.hidden = self.yj_hiddenToolView;
    }
    
    return _yj_pickerToolView;
}

- (void)yj_setPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                      dataSource:(id<UIPickerViewDataSource>)dataSource {
    
    self.yj_pickerView.delegate   = delegate;
    self.yj_pickerView.dataSource = dataSource;
}

- (void)yj_configPickerToolViewActions {
    
    __weak __typeof(self) weakSelf = self;
    
    [self.yj_pickerToolView setYj_pickerToolViewCancelActionBlock:^{
        
        [weakSelf dismissViewControllerAnimated:YES
                                     completion:nil];
    }];
}

- (YJPickerTransitioningDelegate *)yj_pickerTransitioningDelegate {
    
    if (!_yj_pickerTransitioningDelegate) {
        
        _yj_pickerTransitioningDelegate = [[YJPickerTransitioningDelegate alloc] initViewControllerTransitioningDelegateWithController:self];
    }
    
    return _yj_pickerTransitioningDelegate;
}

- (void)yj_addConstraintsWithSuperView {
    
    [self yj_configPickerToolViewActions];
}


@end
