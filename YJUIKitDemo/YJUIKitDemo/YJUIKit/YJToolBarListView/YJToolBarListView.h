//
//  YJToolBarListView.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJToolBarStyle) {
    YJToolBarNormalStyle = 0,
    YJToolBarSeparationStyle
};

@interface YJToolBarListView : UIView

/**
 初始化TooBar
 
 @param frame 设置YJToolBarListView的Frame
 @return self
 */
- (instancetype)initToolBarWithFrame:(CGRect)frame;

/**
 设置ToolBar显示的样式, default: YJToolBarNormalStyle
 */
@property (nonatomic, assign) YJToolBarStyle yj_toolBarStyle;

#pragma mark - Common Property
/**
 是否根据按钮宽度自动缩小标题, default: NO
 */
@property (nonatomic, assign) BOOL yj_titleAdjustsFontSizeToFitWidth;

/**
 标题数组, 在调用reloadData之前不可为空
 */
@property (nonatomic, strong) NSArray  *yj_titleArray;

/**
 选中的按钮文字的颜色, default: redColor
 */
@property (nonatomic, strong) UIColor *yj_selectedColor;

/**
 非选中的按钮文字的颜色, default: blackColor
 */
@property (nonatomic, strong) UIColor *yj_deselectColor;

/**
 背景颜色, default: whiteColor
 */
@property (nonatomic, strong) UIColor *yj_barBakcgroundColor;

/**
 底部线条的颜色, default: grayColor
 */
@property (nonatomic, strong) UIColor *yj_bottomLineColor;

/**
 选中按钮提示条的颜色, default: cyanColor
 */
@property (nonatomic, strong) UIColor *yj_selectedLineColor;

/**
 按钮文字大小, default: 16
 */
@property (nonatomic, assign) NSInteger yj_textFont;

/**
 按钮之间的间距, default: 10
 */
@property (nonatomic, assign) CGFloat yj_buttonSpacing;

/**
 是否需要底部线, default: YES
 */
@property (nonatomic, assign) BOOL yj_isNeedLine;

/**
 是否需要选中提示条, default: YES
 */
@property (nonatomic, assign) BOOL yj_isNeedSelectedLine;

/**
 当前点击的yj_currentIndex, default: 0
 */
@property (nonatomic, getter=currentIndex) NSInteger yj_currentIndex;

#pragma mark - Tool Bar Separation Style Property
/**
 Separation分割线的颜色
 注意: 前提是你设置了yj_toolBarStyle为YJToolBarSeparationStyle才有效, 默认为grayColor
 */
@property (nonatomic, strong) UIColor *yj_separationColor;

/**
 Separation分割线的宽度
 注意: 前提是你设置了yj_toolBarStyle为YJToolBarSeparationStyle才有效, 默认为1
 */
@property (nonatomic, assign) CGFloat yj_separationWidth;

#pragma mark - Common Method
/**
 刷新整个列表
 */
- (void)yj_reloadData;

/**
 指定当前选中的Button Index, 注意: 使用该方法, 必须先得实现yj_reloadData的方法, 否则不生效
 @param index 指定当前选中的Button Index
 */
- (void)yj_didSelectedButton:(NSInteger)index;

/**
 点击事件Block
 */
@property (nonatomic, copy) void(^yj_toolBarSelectedBlock)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
