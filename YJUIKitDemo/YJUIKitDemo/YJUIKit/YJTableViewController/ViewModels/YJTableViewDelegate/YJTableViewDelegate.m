//
//  YJTableViewDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJTableViewDelegate.h"

@interface YJTableViewDelegate ()

@property (nonatomic, weak, readwrite) YJTableViewViewModel *yj_viewModel;

@end

@implementation YJTableViewDelegate 

- (instancetype)initTableViewDelegateWithViewModel:(YJTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.yj_viewModel = viewModel;
    }
    
    return self;
}

@end
