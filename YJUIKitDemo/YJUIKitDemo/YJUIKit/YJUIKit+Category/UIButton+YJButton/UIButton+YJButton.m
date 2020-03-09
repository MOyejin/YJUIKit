 
//  UIButton+YJButton.m
//
//  Created by  MOyejin668 on 2020/1/16.
//  Copyright © 2020年 Moyejin668. All rights reserved.
//

#import "UIButton+YJButton.h"
#import "UIImage+YJImage.h"

#import <objc/runtime.h>

static const void *YJButtonActionKey = &YJButtonActionKey;
static const void *YJButtonSubmitKey = &YJButtonSubmitKey;

static NSString *const kShowActivityIndicatorKey = @"kShowActivityIndicatorKey";
static NSString *const kHideActivityIndicatorKey = @"kHideActivityIndicatorKey";

@interface UIButton ()

@property (nonatomic, assign, readwrite) BOOL yj_isSubmitting;

@end

@implementation UIButton (YJButton)

#pragma mark - 修改点击区域
- (void)setyj_YJickAreaEdgeInsets:(UIEdgeInsets)yj_YJickAreaEdgeInsets {
    
    NSValue *value = [NSValue valueWithUIEdgeInsets:yj_YJickAreaEdgeInsets];
    
    objc_setAssociatedObject(self, @selector(yj_YJickAreaEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)yj_YJickAreaEdgeInsets {
    
    NSValue *value = objc_getAssociatedObject(self, @selector(yj_YJickAreaEdgeInsets));
    
    if (value) {
        
        UIEdgeInsets edgeInset = [value UIEdgeInsetsValue];
        
        return edgeInset;
    }
    
    return UIEdgeInsetsZero;
}

- (BOOL)pointInside:(CGPoint)point
          withEvent:(UIEvent *)event {
    
    if (UIEdgeInsetsEqualToEdgeInsets(self.yj_YJickAreaEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        
        return [super pointInside:point
                        withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.yj_YJickAreaEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

#pragma mark - 是否正在提交
- (void)setyj_isSubmitting:(BOOL)yj_isSubmitting {
    
    objc_setAssociatedObject(self, YJButtonSubmitKey, @(yj_isSubmitting), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)yj_isSubmitting {
    
    return [objc_getAssociatedObject(self, YJButtonSubmitKey) boolValue];
}

#pragma mark - 倒计时方法
- (void)yj_starButtonWithTime:(NSInteger)time
                     complete:(YJButtonStar)complete {

    //倒计时时间
    __block NSInteger timeOut = time;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                complete(self, YJButtonStarStyleFinish, -1);
            });

        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                complete(self, YJButtonStarStyleBegin, timeOut--);
            });
        }
    });
    
    dispatch_resume(_timer);
}

#pragma mark - 添加UIButton点击方法
- (void)yj_addButtonActionComplete:(YJButtonAction)complete {
    
    objc_setAssociatedObject(self, YJButtonActionKey, complete, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self
             action:@selector(yj_buttonAction:)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)yj_buttonAction:(UIButton *)sender {
    
    YJButtonAction yj_buttonAction = objc_getAssociatedObject(self, YJButtonActionKey);
    
    if (yj_buttonAction) {
        
        yj_buttonAction(sender);
    }
}

#pragma mark - 用UIActivityIndicatorView代替文字
- (void)yj_showActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style {
    
    UIActivityIndicatorView *yj_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    
    yj_activityIndicatorView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    [yj_activityIndicatorView startAnimating];
    
    NSString *yj_buttonTitleString = self.titleLabel.text;
    
    objc_setAssociatedObject(self, &kShowActivityIndicatorKey, yj_activityIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kHideActivityIndicatorKey, yj_buttonTitleString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@""
          forState:UIControlStateNormal];
    
    self.enabled = NO;
    self.yj_isSubmitting = YES;
    
    [self addSubview:yj_activityIndicatorView];
}

- (void)yj_hideActivityIndicatorView {
    
    NSString *yj_buttonTitleString = (NSString *)objc_getAssociatedObject(self, &kHideActivityIndicatorKey);
    
    UIActivityIndicatorView *yj_activityIndicatorView = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &kShowActivityIndicatorKey);
    
    [yj_activityIndicatorView removeFromSuperview];
    
    [self setTitle:yj_buttonTitleString
          forState:UIControlStateNormal];
    
    self.enabled = YES;
    self.yj_isSubmitting = NO;
}

#pragma mark - 设置UIButton图片
- (void)yj_setNormalButtonWithImage:(UIImage *)image {
    
    [self setImage:image
          forState:UIControlStateNormal];
}

- (void)yj_setNormalButtonImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
        
                                [self yj_setNormalButtonWithImage:image];
                            }];
}

- (void)yj_setHighlightedButtonWithImage:(UIImage *)image {
    
    [self setImage:image
          forState:UIControlStateHighlighted];
}

- (void)yj_setHighlightedButtonImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setHighlightedButtonWithImage:image];
                            }];
}

- (void)yj_setSelectedButtonWithImage:(UIImage *)image {
    
    [self setImage:image
          forState:UIControlStateSelected];
}

- (void)yj_setSelectedButtonImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setSelectedButtonWithImage:image];
                            }];
}

- (void)yj_setDisabledButtonWithImage:(UIImage *)image {
    
    [self setImage:image
          forState:UIControlStateDisabled];
}

- (void)yj_setDisabledButtonImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setDisabledButtonWithImage:image];
                            }];
}

#pragma mark - 获取UIButton的背景图片
- (void)yj_setNormalButtonBackgroundImageWithImage:(UIImage *)image {
    
    [self setBackgroundImage:image
                    forState:UIControlStateNormal];
}

- (void)yj_setNormalButtonBackgroundImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setNormalButtonBackgroundImageWithImage:image];
                            }];
}

- (void)yj_setHighlightedButtonBackgroundImageWithImage:(UIImage *)image {
    
    [self setBackgroundImage:image
                    forState:UIControlStateHighlighted];
}

- (void)yj_setHighlightedButtonBackgroundImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setHighlightedButtonBackgroundImageWithImage:image];
                            }];
}

- (void)yj_setSelectedButtonBackgroundImageWithImage:(UIImage *)image {
    
    [self setBackgroundImage:image
                    forState:UIControlStateSelected];
}

- (void)yj_setSelectedButtonBackgroundImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setSelectedButtonBackgroundImageWithImage:image];
                            }];
}

- (void)yj_setDisabledButtonBackgroundImageWithImage:(UIImage *)image {
    
    [self setBackgroundImage:image
                    forState:UIControlStateDisabled];
}

- (void)yj_setDisabledButtonBackgroundImageWithColor:(UIColor *)color {
    
    [UIImage yj_asyncGetImageWithColor:color
                            completion:^(UIImage *image) {
                                
                                [self yj_setDisabledButtonBackgroundImageWithImage:image];
                            }];
}

#pragma mark - 获取UIButton的图片
- (UIImage *)yj_getNormalButtonImage {
    
    return [self imageForState:UIControlStateNormal];
}

- (UIImage *)yj_getHighlightedButtonImage {
    
    return [self imageForState:UIControlStateHighlighted];
}

- (UIImage *)yj_getSelectedButtonImage {
    
    return [self imageForState:UIControlStateSelected];
}

- (UIImage *)yj_getDisabledButtonImage {
    
    return [self imageForState:UIControlStateDisabled];
}

- (UIImage *)yj_getNormalButtonBackgroundImage {
    
    return [self backgroundImageForState:UIControlStateNormal];
}

- (UIImage *)yj_getHighlightedButtonBackgroundImage {
    
    return [self backgroundImageForState:UIControlStateHighlighted];
}

- (UIImage *)yj_getSelectedButtonBackgroundImage {
    
    return [self backgroundImageForState:UIControlStateSelected];
}

- (UIImage *)yj_getDisabledButtonBackgroundImage {
    
    return [self backgroundImageForState:UIControlStateDisabled];
}

#pragma mark - 设置UIButton标题
- (void)yj_setNormalButtonWithTitle:(NSString *)title {
    
    [self setTitle:title
          forState:UIControlStateNormal];
}

- (void)yj_setHighlightedButtonWithTitle:(NSString *)title {
    
    [self setTitle:title
          forState:UIControlStateHighlighted];
}

- (void)yj_setSelectedButtonWithTitle:(NSString *)title {
    
    [self setTitle:title
          forState:UIControlStateSelected];
}

- (void)yj_setDisabledButtonWithTitle:(NSString *)title {
    
    [self setTitle:title
          forState:UIControlStateDisabled];
}

#pragma mark - 获取UIButton标题
- (NSString *)yj_getNormalButtonTitle {
    
    return [self titleForState:UIControlStateNormal];
}

- (NSString *)yj_getHighlightedButtonTitle {
    
    return [self titleForState:UIControlStateHighlighted];
}

- (NSString *)yj_getSelectedButtonTitle {
    
    return [self titleForState:UIControlStateSelected];
}

- (NSString *)yj_getDisabledButtonTitle {
    
    return [self titleForState:UIControlStateDisabled];
}

#pragma mark - 设置UIButton标题颜色
- (void)yj_setNormalTitleWithColor:(UIColor *)color {
    
    [self setTitleColor:color
               forState:UIControlStateNormal];
}

- (void)yj_setHighlightedTitleWithColor:(UIColor *)color {
    
    [self setTitleColor:color
               forState:UIControlStateHighlighted];
}

- (void)yj_setSelectedTitleWithColor:(UIColor *)color {
    
    [self setTitleColor:color
               forState:UIControlStateSelected];
}

- (void)yj_setDisabledTitleWithColor:(UIColor *)color {
    
    [self setTitleColor:color
               forState:UIControlStateDisabled];
}

#pragma mark - 获取UIButton标题颜色
- (UIColor *)yj_getNormalButtonTitleColor {
    
    return [self titleColorForState:UIControlStateNormal];
}

- (UIColor *)yj_getHighlightedButtonTitleColor {
    
    return [self titleColorForState:UIControlStateHighlighted];
}

- (UIColor *)yj_getSelectedButtonTitleColor {
    
    return [self titleColorForState:UIControlStateSelected];
}

- (UIColor *)yj_getDisabledButtonTitleColor {
    
    return [self titleColorForState:UIControlStateDisabled];
}

#pragma mark - 设置UIButton的NSAttributedString标题
- (void)yj_setNormalButtonWithAttributedStringTitle:(NSAttributedString *)attributedString {
    
    [self setAttributedTitle:attributedString
                    forState:UIControlStateNormal];
}

- (void)yj_setHighlightedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString {
    
    [self setAttributedTitle:attributedString
                    forState:UIControlStateHighlighted];
}

- (void)yj_setSelectedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString {
    
    [self setAttributedTitle:attributedString
                    forState:UIControlStateSelected];
}

- (void)yj_setDisabledButtonWithAttributedStringTitle:(NSAttributedString *)attributedString {
    
    [self setAttributedTitle:attributedString
                    forState:UIControlStateDisabled];
}

#pragma mark - 获取UIButton标题
- (NSAttributedString *)yj_getNormalButtonAttributedStringTitle {
    
    return [self attributedTitleForState:UIControlStateNormal];
}

- (NSAttributedString *)yj_getHighlightedButtonAttributedStringTitle {
    
    return [self attributedTitleForState:UIControlStateHighlighted];
}

- (NSAttributedString *)yj_getSelectedButtonAttributedStringTitle {
    
    return [self attributedTitleForState:UIControlStateSelected];
}

- (NSAttributedString *)yj_getDisabledButtonAttributedStringTitle {
    
    return [self attributedTitleForState:UIControlStateDisabled];
}

@end
