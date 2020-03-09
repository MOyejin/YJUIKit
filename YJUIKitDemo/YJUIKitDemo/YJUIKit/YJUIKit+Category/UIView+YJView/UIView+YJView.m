 
//  UIView+YJView.m
//  ShareHotel
//
//  Created by Mac on 2020/1/16.
//  Copyright © 2020年 MOyejin   All rights reserved.
//

#import "UIView+YJView.h"
#import "NSObject+YJObject.h"

static char YJTapGestureKey;
static char YJTapGestureBlockKey;
static char YJLongGestureKey;
static char YJLongGestureBlockKey;

@implementation UIView (YJView)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (@available(iOS 11, *)) {
            
            [self yj_exchangeImplementationsWithClass:NSClassFromString(@"_UIBackButtonContainerView")
                                     originalSelector:@selector(addSubview:)
                                     swizzledSelector:@selector(yj_backButtonTitleAddSubview:)];
        }
    });
}

- (void)yj_backButtonTitleAddSubview:(UIView *)view {
    
    view.alpha = 0;
    
    if ([view isKindOfClass:[UIButton class]]) {
        
        UIButton *button = (UIButton *)view;
        
        [button setTitle:@""
                forState:UIControlStateNormal];
    }
    
    [self yj_backButtonTitleAddSubview:view];
}

#pragma mark - 设置UIView相关的
- (void)setYj_size:(CGSize)yj_size {
    
    CGPoint yj_origin = self.frame.origin;
    
    [self setFrame:CGRectMake(yj_origin.x, yj_origin.y, yj_size.width, yj_size.height)];
}

- (CGSize)yj_size {
    
    return self.frame.size;
}

- (void)setYj_width:(CGFloat)yj_width {
    
    CGRect yj_frame = self.frame;
    
    yj_frame.size.width = yj_width;
    
    self.frame = CGRectStandardize(yj_frame);
}

- (CGFloat)yj_width {
    
    return CGRectGetWidth(self.frame);
}

- (void)setYj_height:(CGFloat)yj_height {
    
    CGRect yj_frame = self.frame;
    
    yj_frame.size.height = yj_height;
    
    self.frame = CGRectStandardize(yj_frame);
}

- (CGFloat)yj_height {
    
    return CGRectGetHeight(self.frame);
}

- (void)setYj_top:(CGFloat)yj_top {
    
    CGRect yj_frame = self.frame;
    
    yj_frame.origin.y = yj_top;
    
    self.frame = yj_frame;
}

- (CGFloat)yj_top {
    
    return CGRectGetMinY(self.frame);
}

- (void)setYj_left:(CGFloat)yj_left {
    
    CGRect yj_frame = self.frame;
    
    yj_frame.origin.x = yj_left;
    
    self.frame = yj_frame;
}

- (CGFloat)yj_left {
    
    return CGRectGetMinX(self.frame);
}

- (void)setYj_bottom:(CGFloat)yj_bottom {
    
    CGRect yj_frame = self.frame;
    
    yj_frame.origin.y = yj_bottom - yj_frame.size.height;
    
    self.frame = yj_frame;
}

- (CGFloat)yj_bottom {
    
    return CGRectGetMaxX(self.frame);
}

- (void)setYj_right:(CGFloat)yj_right {
    
    CGRect yj_frame = self.frame;
    
    yj_frame.origin.x = yj_right - yj_frame.size.width;
    
    self.frame = yj_frame;
}

- (CGFloat)yj_right {
    
    return CGRectGetMaxX(self.frame);
}

- (void)setYj_centerX:(CGFloat)yj_centerX {
    
    self.center = CGPointMake(yj_centerX, self.center.y);
}

- (CGFloat)yj_centerX {
    
    return self.center.x;
}

- (void)setYj_centerY:(CGFloat)yj_centerY {
    
    self.center = CGPointMake(self.center.x, yj_centerY);
}

- (CGFloat)yj_centerY {
    
    return self.center.y;
}

#pragma mark - 添加手势
- (void)yj_addTapGestureRecognizerWithBlock:(YJGestureActionBlock)block {
    
    UITapGestureRecognizer *yj_tapGestureRecognizer = objc_getAssociatedObject(self, &YJTapGestureKey);

    if (!yj_tapGestureRecognizer) {

        yj_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(yj_tapGestureRecognizerAction:)];

        [self addGestureRecognizer:yj_tapGestureRecognizer];

        objc_setAssociatedObject(self, &YJTapGestureKey, block, OBJC_ASSOCIATION_RETAIN);
    }

    objc_setAssociatedObject(self, &YJTapGestureBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)yj_tapGestureRecognizerAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    if (tapGestureRecognizer.state == UIGestureRecognizerStateRecognized) {

        YJGestureActionBlock yj_gestureActionBlock = objc_getAssociatedObject(self, &YJTapGestureBlockKey);

        if (yj_gestureActionBlock) {

            yj_gestureActionBlock(tapGestureRecognizer);
        }
    }
}

- (void)yj_addLongPressGestureRecognizerWithBlock:(YJGestureActionBlock)block {
    
    UILongPressGestureRecognizer *yj_longPressGestureRecognizer = objc_getAssociatedObject(self, &YJLongGestureKey);

    if (!yj_longPressGestureRecognizer) {

        yj_longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(yj_longPressGestureRecognizerAction:)];
        [self addGestureRecognizer:yj_longPressGestureRecognizer];

        objc_setAssociatedObject(self, &YJLongGestureKey, block, OBJC_ASSOCIATION_RETAIN);
    }

    objc_setAssociatedObject(self, &YJLongGestureBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)yj_longPressGestureRecognizerAction:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateRecognized) {

        YJGestureActionBlock yj_gestureActionBlock = objc_getAssociatedObject(self, &YJLongGestureBlockKey);

        if (yj_gestureActionBlock) {

            yj_gestureActionBlock(longPressGestureRecognizer);
        }
    }
}

#pragma mark - 获取UIView相关的
- (id)yj_getSubViewWithSubViewClass:(Class)objcClass {
    
    UIView *__block yj_subView;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:objcClass]) {
            
            yj_subView = obj;
        }
    }];
    
    return yj_subView;
}

- (id)yj_getSuperViewWithSuperViewClass:(Class)objcClass {
    
    if (!self || !self.superview) {
        
        return nil;
    } else if ([self.superview isKindOfClass:objcClass]) {
        
        return self.superview;
    } else {
        
        return [self.superview yj_getSuperViewWithSuperViewClass:objcClass];
    }
}

#pragma mark - 响应者相关的
- (BOOL)yj_resignFirstResponder {
    
    if (self.isFirstResponder) {
        
        [self resignFirstResponder];
        
        return YES;
    }
    
    BOOL __block isResign = NO;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj yj_resignFirstResponder]) {
            
            isResign = YES;
        }
    }];
    
    return isResign;
}

- (UIView *)yj_getFirstResponder {
    
    BOOL yj_isResponderClass = [self isKindOfClass:[UITextView class]] || [self isKindOfClass:[UITextField class]];
    
    if (yj_isResponderClass && self.isFirstResponder) {
        
        return self;
    }
    
    UIView __block *yj_responderView;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj yj_getFirstResponder]) {
            
            yj_responderView = obj;
        }
    }];
    
    return yj_responderView;
}

@end
