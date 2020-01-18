 
//  UICollectionView+YJCollectionView.m
//  SimpleProject
//
//  Created by Moyejin668 on 2018/1/21.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UICollectionView+YJCollectionView.h"
#import "UIColor+YJColor.h"
#import <objc/runtime.h>

static void *YJPlaceholderView = &YJPlaceholderView;

@implementation UICollectionView (YJCollectionView)

#pragma mark - YJPlaceholderView
- (void)setYj_placeholderView:(UIView *)yj_placeholderView {
    
    objc_setAssociatedObject(self, YJPlaceholderView, yj_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)yj_placeholderView {
    
    return objc_getAssociatedObject(self, YJPlaceholderView);
}

- (void)yj_removePlaceholderViewWithSuperView {
    
    [self.yj_placeholderView removeFromSuperview];
    
    self.yj_placeholderView = nil;
}

- (void)yj_reloadData {
    
    [self reloadData];
    
    [self yj_checkEmpty];
}

#pragma mark - Check Empty
- (void)yj_checkEmpty {
    
    BOOL yj_isEmpty = YES;
    
    id<UICollectionViewDataSource> yj_dataSource = self.dataSource;
    
    NSInteger yj_sections = 1;
    
    if ([yj_dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        
        yj_sections = [yj_dataSource numberOfSectionsInCollectionView:self];
    }
    
    for (int i = 0; i < yj_sections; ++i) {
        
        NSInteger rows = [yj_dataSource collectionView:self
                                numberOfItemsInSection:i];
        
        if (rows) {
            
            yj_isEmpty = NO;
        }
    }
    
    if (!yj_isEmpty != !self.yj_placeholderView) {
        
        if (yj_isEmpty) {
            
            self.scrollEnabled = [self yj_responseScrollEnabledWithShowPlaceholderView];
            
            self.yj_placeholderView = [self yj_responseCollectionViewPlaceholderView];
            
            self.yj_placeholderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
            
            [self addSubview:self.yj_placeholderView];
        } else {
            
            [self yj_removePlaceholderViewWithSuperView];
        }
        
    } else if (yj_isEmpty){
        
        self.scrollEnabled = [self yj_responseScrollEnabledWithShowPlaceholderView];
        
        [self.yj_placeholderView removeFromSuperview];
        
        [self addSubview:self.yj_placeholderView];
    }
}

#pragma mark - Response Delegate Method
- (UIView *)yj_responseCollectionViewPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(yj_placeholderView)]) {
        
        return [self.delegate performSelector:@selector(yj_placeholderView)];
        
    } else if ([self respondsToSelector:@selector(yj_placeholderView)]) {
        
        return [self performSelector:@selector(yj_placeholderView)];
    } else {
        
        return nil;
    }
}

#pragma mark - Response Delegate Method
- (BOOL)yj_responseScrollEnabledWithShowPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)]) {
        
        BOOL yj_scrollEnable = [[self.delegate performSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)] boolValue];
        
        return yj_scrollEnable;
        
    } else if ([self respondsToSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)]) {
        
        BOOL yj_scrollEnable = [[self.delegate performSelector:@selector(yj_scrollEnabledWithShowPlaceholderView)] boolValue];

        return yj_scrollEnable;
        
    } else {
        
        return YES;
    }
}

@end
