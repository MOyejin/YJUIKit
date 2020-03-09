 
//  UIButton+YJButton.h
//
//  Created by  MOyejin668 on 2020/1/16.
//  Copyright © 2020年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIButton倒计时的状态

 - YJButtonStarStyleBegin: 开始倒计时
 - YJButtonStarStyleFinish: 倒计时完成
 */
typedef NS_ENUM(NSInteger, YJButtonStarStyle) {
    YJButtonStarStyleBegin = 0,
    YJButtonStarStyleFinish
};

/**
 UIButton倒计时的回调

 @param yj_starButton UIButton
 @param yj_buttonStarStyle YJButtonStarStyle
 @param time NSInteger
 */
typedef void(^YJButtonStar)(UIButton *yj_starButton, YJButtonStarStyle yj_buttonStarStyle, NSInteger time);

/**
 UIButton的事件回调

 @param sender UIButton
 */
typedef void (^YJButtonAction)(UIButton *sender);

@interface UIButton (YJButton)

/**
 设置Button的点击区域
 */
@property (nonatomic, assign) UIEdgeInsets yj_YJickAreaEdgeInsets;

/**
 按钮是否正在提交中
 */
@property (nonatomic, assign, readonly) BOOL yj_isSubmitting;

#pragma mark - 倒计时方法
/**
 倒计时方法

 @param time 倒计时时间
 @param complete 倒计时的回调
 */
- (void)yj_starButtonWithTime:(NSInteger)time
                     complete:(YJButtonStar)complete;

#pragma mark - 添加UIButton点击方法
/**
 给UIButton添加一个Action Block

 @param complete YJButtonAction
 */
- (void)yj_addButtonActionComplete:(YJButtonAction)complete;

#pragma mark - 用UIActivityIndicatorView代替文字
/**
 显示UIActivityIndicatorView
 */
- (void)yj_showActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style;

/**
 隐藏UIActivityIndicatorView
 */
- (void)yj_hideActivityIndicatorView;

#pragma mark - 设置UIButton图片
/**
 设置UIButton Normal状态下的图片

 @param image UIImage
 */
- (void)yj_setNormalButtonWithImage:(UIImage *)image;

/**
 设置UIButton Normal状态下的纯色图片

 @param color UIColor
 */
- (void)yj_setNormalButtonImageWithColor:(UIColor *)color;

/**
 设置UIButton Highlighted状态下的图片
 
 @param image UIImage
 */
- (void)yj_setHighlightedButtonWithImage:(UIImage *)image;

/**
 设置UIButton Highlighted状态下的纯色图片
 
 @param color UIColor
 */
- (void)yj_setHighlightedButtonImageWithColor:(UIColor *)color;

/**
 设置UIButton Selected状态下的图片
 
 @param image UIImage
 */
- (void)yj_setSelectedButtonWithImage:(UIImage *)image;

/**
 设置UIButton Selected状态下的纯色图片
 
 @param color UIColor
 */
- (void)yj_setSelectedButtonImageWithColor:(UIColor *)color;

/**
 设置UIButton Disabled状态下的图片
 
 @param image UIImage
 */
- (void)yj_setDisabledButtonWithImage:(UIImage *)image;

/**
 设置UIButton Disabled状态下的纯色图片
 
 @param color UIColor
 */
- (void)yj_setDisabledButtonImageWithColor:(UIColor *)color;

#pragma mark - 设置UIButton背景图片
/**
 设置UIButton Normal状态下的背景图片
 
 @param image UIImage
 */
- (void)yj_setNormalButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Normal状态下的背景纯色图片
 
 @param color UIColor
 */
- (void)yj_setNormalButtonBackgroundImageWithColor:(UIColor *)color;

/**
 设置UIButton Highlighted状态下的背景图片
 
 @param image UIImage
 */
- (void)yj_setHighlightedButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Highlighted状态下的背景纯色图片
 
 @param color UIColor
 */
- (void)yj_setHighlightedButtonBackgroundImageWithColor:(UIColor *)color;

/**
 设置UIButton Selected状态下的背景图片
 
 @param image UIImage
 */
- (void)yj_setSelectedButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Selected状态下的背景纯色图片
 
 @param color UIColor
 */
- (void)yj_setSelectedButtonBackgroundImageWithColor:(UIColor *)color;

/**
 设置UIButton Disabled状态下的背景图片
 
 @param image UIImage
 */
- (void)yj_setDisabledButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Disabled状态下的背景纯色图片

 @param color UIColor
 */
- (void)yj_setDisabledButtonBackgroundImageWithColor:(UIColor *)color;

#pragma mark - 获取UIButton的图片
/**
 获取UIButton Normal状态下的图片

 @return UIImage
 */
- (UIImage *)yj_getNormalButtonImage;

/**
 获取UIButton Highlighted状态下的图片
 
 @return UIImage
 */
- (UIImage *)yj_getHighlightedButtonImage;

/**
 获取UIButton Selected状态下的图片
 
 @return UIImage
 */
- (UIImage *)yj_getSelectedButtonImage;

/**
 获取UIButton Disabled状态下的图片
 
 @return UIImage
 */
- (UIImage *)yj_getDisabledButtonImage;

#pragma mark - 获取UIButton的背景图片
/**
 获取UIButton Normal状态下的背景图片

 @return UIImage
 */
- (UIImage *)yj_getNormalButtonBackgroundImage;

/**
 获取UIButton Highlighted状态下的背景图片
 
 @return UIImage
 */
- (UIImage *)yj_getHighlightedButtonBackgroundImage;

/**
 获取UIButton Selected状态下的背景图片
 
 @return UIImage
 */
- (UIImage *)yj_getSelectedButtonBackgroundImage;

/**
 获取UIButton Disabled状态下的背景图片
 
 @return UIImage
 */
- (UIImage *)yj_getDisabledButtonBackgroundImage;

#pragma mark - 设置UIButton标题
/**
 设置UIButton Normal状态下的标题
 
 @param title NSString
 */
- (void)yj_setNormalButtonWithTitle:(NSString *)title;

/**
 设置UIButton Highlighted状态下的标题
 
 @param title NSString
 */
- (void)yj_setHighlightedButtonWithTitle:(NSString *)title;

/**
 设置UIButton Selected状态下的标题
 
 @param title NSString
 */
- (void)yj_setSelectedButtonWithTitle:(NSString *)title;

/**
 设置UIButton Disabled状态下的标题
 
 @param title NSString
 */
- (void)yj_setDisabledButtonWithTitle:(NSString *)title;

#pragma mark - 获取UIButton标题
/**
 获取UIButton Normal状态下的标题
 
 @return NSString
 */
- (NSString *)yj_getNormalButtonTitle;

/**
 获取UIButton Highlighted状态下的标题
 
 @return NSString
 */
- (NSString *)yj_getHighlightedButtonTitle;

/**
 获取UIButton Selected状态下的标题
 
 @return NSString
 */
- (NSString *)yj_getSelectedButtonTitle;

/**
 获取UIButton Disabled状态下的标题
 
 @return NSString
 */
- (NSString *)yj_getDisabledButtonTitle;

#pragma mark - 设置UIButton标题
/**
 设置UIButton Normal状态下的标题颜色
 
 @param color UIColor
 */
- (void)yj_setNormalTitleWithColor:(UIColor *)color;

/**
 设置UIButton Highlighted状态下的标题颜色
 
 @param color UIColor
 */
- (void)yj_setHighlightedTitleWithColor:(UIColor *)color;

/**
 设置UIButton Selected状态下的标题颜色
 
 @param color UIColor
 */
- (void)yj_setSelectedTitleWithColor:(UIColor *)color;

/**
 设置UIButton Disabled状态下的标题颜色
 
 @param color UIColor
 */
- (void)yj_setDisabledTitleWithColor:(UIColor *)color;

#pragma mark - 获取UIButton标题颜色
/**
 获取UIButton Normal状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)yj_getNormalButtonTitleColor;

/**
 获取UIButton Highlighted状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)yj_getHighlightedButtonTitleColor;

/**
 获取UIButton Selected状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)yj_getSelectedButtonTitleColor;

/**
 获取UIButton Disabled状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)yj_getDisabledButtonTitleColor;

#pragma mark - 设置UIButton的NSAttributedString标题
/**
 设置UIButton Normal状态下的NSAttributedString标题

 @param attributedString NSAttributedString
 */
- (void)yj_setNormalButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

/**
 设置UIButton Highlighted状态下的NSAttributedString标题
 
 @param attributedString NSAttributedString
 */
- (void)yj_setHighlightedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

/**
 设置UIButton Selected状态下的NSAttributedString标题
 
 @param attributedString NSAttributedString
 */
- (void)yj_setSelectedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

/**
 设置UIButton Disabled状态下的NSAttributedString标题
 
 @param attributedString NSAttributedString
 */
- (void)yj_setDisabledButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

#pragma mark - 获取UIButton标题
/**
 获取UIButton Normal状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)yj_getNormalButtonAttributedStringTitle;

/**
 获取UIButton Highlighted状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)yj_getHighlightedButtonAttributedStringTitle;

/**
 获取UIButton Selected状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)yj_getSelectedButtonAttributedStringTitle;

/**
 获取UIButton Disabled状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)yj_getDisabledButtonAttributedStringTitle;

@end
