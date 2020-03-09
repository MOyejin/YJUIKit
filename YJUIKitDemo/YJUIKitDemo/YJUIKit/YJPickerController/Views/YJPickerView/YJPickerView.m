//
//  YJPickerView.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerView.h"

@interface YJPickerView ()

@property (nonatomic, strong) UIView *yj_selectView;

@end

@implementation YJPickerView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.subviews.count && self.yj_selectionColor) {
        
        [self yj_configPickerViewSelectionIndicator];
    }
}

- (void)yj_configPickerViewSelectionIndicator {
    
    UIView *yj_lineOneView = self.subviews[1];
    UIView *yj_lineTwoView = self.subviews[2];
    
    yj_lineOneView.backgroundColor = [UIColor clearColor];
    yj_lineTwoView.backgroundColor = [UIColor clearColor];
    
    for (UIView *yj_subViews in self.subviews) {
        
        if(yj_subViews.subviews.count){
            
            UIView *yj_contentViews = yj_subViews.subviews[0];
            
            for (UIView *yj_contentSubView in yj_contentViews.subviews) {
                
                if(yj_contentSubView.center.y == yj_contentViews.center.y) {
                    
                    if(self.yj_selectView != yj_contentSubView) {
                        
                        self.yj_selectView.backgroundColor = [UIColor clearColor];
                        self.yj_selectView                 = yj_contentSubView;
                        self.yj_selectView.backgroundColor = self.yj_selectionColor;
                    }
                    break;
                }
            }
            break;
        }
    }
}

@end
