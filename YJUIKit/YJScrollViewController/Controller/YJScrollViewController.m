//
//  YJScrollViewController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJScrollViewController.h"

@interface YJScrollViewController ()

@property (nonatomic, strong, readwrite) UIScrollView *yj_scrollView;


@end

@implementation YJScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.yj_scrollView];
}

- (void)yj_setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate {
    
    self.yj_scrollView.delegate = delegate;
}

- (void)yj_hiddenScrollIndicator {
    
    self.yj_scrollView.showsVerticalScrollIndicator   = NO;
    self.yj_scrollView.showsHorizontalScrollIndicator = NO;
}

- (UIScrollView *)yj_scrollView {
    
    if (!_yj_scrollView) {
        
        _yj_scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        
        _yj_scrollView.backgroundColor = [UIColor whiteColor];
    }
    
    return _yj_scrollView;
}


@end
