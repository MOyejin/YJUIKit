 
//  UIView+YJView.h
//  ShareHotel
//
//  Created by Mac on 2020/1/16.
//  Copyright © 2020年 MOyejin   All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YJGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (YJView)

@property (nonatomic, assign) CGSize yj_size;

@property (nonatomic, assign) CGFloat yj_width;
@property (nonatomic, assign) CGFloat yj_height;
@property (nonatomic, assign) CGFloat yj_top;
@property (nonatomic, assign) CGFloat yj_left;
@property (nonatomic, assign) CGFloat yj_bottom;
@property (nonatomic, assign) CGFloat yj_right;
@property (nonatomic, assign) CGFloat yj_centerX;
@property (nonatomic, assign) CGFloat yj_centerY;

/**
 添加UITapGestureRecognizer手势
 
 @param block CLGestureActionBlock
 */
- (void)yj_addTapGestureRecognizerWithBlock:(YJGestureActionBlock)block;

/**
 添加UILongPressGestureRecognizer手势
 
 @param block CLGestureActionBlock
 */
- (void)yj_addLongPressGestureRecognizerWithBlock:(YJGestureActionBlock)block;

/**
 获取指定类名的SubView
 
 @param objcClass Class
 @return id
 */
- (id)yj_getSubViewWithSubViewClass:(Class)objcClass;

/**
 获取指定类名SuperView
 
 @param objcClass Class
 @return id
 */
- (id)yj_getSuperViewWithSuperViewClass:(Class)objcClass;

/**
 取消第一响应者事件
 
 @return BOOL
 */
- (BOOL)yj_resignFirstResponder;

/**
 获取第一响应者视UIView
 
 @return UIView
 */
- (UIView *)yj_getFirstResponder;


@end
