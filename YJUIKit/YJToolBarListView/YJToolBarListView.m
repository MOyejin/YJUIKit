//
//  YJToolBarListView.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJToolBarListView.h"

#define SELECTED_LINE_LAYER_HEIGHT 3

@interface YJToolBarListView()

@property (nonatomic, strong) CALayer  *yj_bottomLineLayer;
@property (nonatomic, strong) CALayer  *yj_selectedLineLayer;
@property (nonatomic, strong) UIButton *yj_currentButton;

@property (nonatomic, strong) NSMutableArray *yj_buttonArray;

@end

@implementation YJToolBarListView

#pragma mark - 初始化ToolBar
- (instancetype)initToolBarWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _yj_deselectColor   = [UIColor blackColor];
        _yj_selectedColor   = [UIColor redColor];
        _yj_bottomLineColor = [UIColor grayColor];
        _yj_buttonSpacing   = 10.f;
        _yj_textFont        = 16;
        _yj_toolBarStyle    = YJToolBarNormalStyle;
        
        _yj_titleAdjustsFontSizeToFitWidth = NO;
        
        _yj_separationColor = [UIColor grayColor];
        _yj_separationWidth = 1;
        
        [self.layer addSublayer:self.yj_bottomLineLayer];
        [self.layer addSublayer:self.yj_selectedLineLayer];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

#pragma mark - 设置ToolBar显示的样式
- (void)setyj_toolBarStyle:(YJToolBarStyle)yj_toolBarStyle {
    _yj_toolBarStyle = yj_toolBarStyle;
}

#pragma mark - 设置未选中的按钮颜色
- (void)setyj_deselectColor:(UIColor *)yj_deselectColor {
    _yj_deselectColor = yj_deselectColor;
}

#pragma mark - 设置选中的按钮颜色
- (void)setyj_SelectedColor:(UIColor *)yj_selectedColor {
    _yj_selectedColor = yj_selectedColor;
}

#pragma mark - 设置ToolBar的背景颜色
- (void)setyj_barBakcgroundColor:(UIColor *)yj_barBakcgroundColor {
    self.backgroundColor = yj_barBakcgroundColor;
}

#pragma mark - 设置底部线条的颜色
- (void)setyj_bottomLineColor:(UIColor *)yj_bottomLineColor {
    
    _yj_bottomLineColor = yj_bottomLineColor;
    
    _yj_bottomLineLayer.backgroundColor = yj_bottomLineColor.CGColor;
}

#pragma mark - 设置选中提示条的颜色
- (void)setyj_selectedLineColor:(UIColor *)yj_selectedLineColor {
    
    _yj_selectedLineColor = yj_selectedLineColor;
    
    _yj_selectedLineLayer.backgroundColor = yj_selectedLineColor.CGColor;
}

#pragma mark - 设置按钮文字大小
- (void)setyj_textFont:(NSInteger)yj_textFont {
    _yj_textFont = yj_textFont;
}

#pragma mark - 设置标题文字是否自动缩小
- (void)setyj_titleAdjustsFontSizeToFitWidth:(BOOL)yj_titleAdjustsFontSizeToFitWidth {
    _yj_titleAdjustsFontSizeToFitWidth = yj_titleAdjustsFontSizeToFitWidth;
}

#pragma mark - 设置按钮之间的间距
- (void)setyj_ButtonSpacing:(CGFloat)yj_buttonSpacing {
    _yj_buttonSpacing = yj_buttonSpacing;
}

#pragma mark - 是否需要底部线
- (void)setyj_isNeedLine:(BOOL)yj_isNeedLine {
    _yj_isNeedLine = yj_isNeedLine;
}

#pragma mark - 是否需要选中提示线
- (void)setyj_isNeedSelectedLine:(BOOL)yj_isNeedSelectedLine {
    _yj_isNeedSelectedLine = yj_isNeedSelectedLine;
}

#pragma mark - 获取当前点中的Button
- (NSInteger)yj_currentIndex {
    return _yj_currentIndex;
}

#pragma mark - 默认选中指定的按钮
- (void)yj_didSelectedButton:(NSInteger)index {
    
    if (self.yj_buttonArray.count > 0) {
        
        self.yj_currentButton.selected = NO;
        
        UIButton *selecteButton = self.yj_buttonArray[index];
        
        self.yj_currentIndex = index;
        
        self.yj_currentButton = selecteButton;
        
        self.yj_currentButton.selected = YES;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            self.yj_selectedLineLayer.frame = CGRectMake(selecteButton.frame.origin.x,
                                                         self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                         selecteButton.frame.size.width,
                                                         SELECTED_LINE_LAYER_HEIGHT);
        }];
    }
}

#pragma mark - 刷新整个BarList
- (void)yj_reloadData {
    
    NSAssert(self.yj_titleArray.count, @"你所传入的数组为空");
    
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:[UIButton class]]) {
            
            [subView removeFromSuperview];
        }
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            [subView removeFromSuperview];
        }
    }
    
    UIView *layerBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    layerBackgroundView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    
    [self addSubview:layerBackgroundView];
    
    for (NSInteger i = 0; i < self.yj_titleArray.count; i++) {
        
        CGFloat buttonWidth = self.frame.size.width / _yj_titleArray.count;
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat buttonX = i == 0 ? i * buttonWidth + (_yj_buttonSpacing / 2) : i * buttonWidth + _yj_buttonSpacing - (_yj_buttonSpacing / 2);
        
        titleButton.frame = CGRectMake(buttonX,
                                       0,
                                       buttonWidth - _yj_buttonSpacing,
                                       self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT);
        titleButton.tag   = i;
        
        titleButton.titleLabel.font = [UIFont systemFontOfSize:self.yj_textFont];
        titleButton.titleLabel.adjustsFontSizeToFitWidth = _yj_titleAdjustsFontSizeToFitWidth;
        
        titleButton.backgroundColor = [UIColor clearColor];
        
        [titleButton setTintColor:[UIColor clearColor]];
        
        [titleButton setTitle:_yj_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitle:_yj_titleArray[i] forState:UIControlStateSelected];
        
        [titleButton setTitleColor:_yj_deselectColor forState:UIControlStateNormal];
        [titleButton setTitleColor:_yj_selectedColor forState:UIControlStateSelected];
        
        [titleButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            titleButton.selected = YES;
            self.yj_currentButton = titleButton;
        }
        
        [self addSubview:titleButton];
        [self.yj_buttonArray addObject:titleButton];
        
        if (_yj_toolBarStyle == YJToolBarSeparationStyle) {
            
            CALayer *separationLayer = [CALayer layer];
            
            separationLayer.backgroundColor = _yj_separationColor.CGColor;
            
            CGFloat separationLayerH = titleButton.frame.size.height - 15;
            
            separationLayer.frame = CGRectMake(i * buttonWidth - 0.5, (titleButton.frame.size.height - separationLayerH) / 2, _yj_separationWidth, separationLayerH);
            
            if (i != 0) {
                [layerBackgroundView.layer addSublayer:separationLayer];
            }
        }
    }
    
    _yj_selectedLineLayer.frame = CGRectMake(_yj_buttonSpacing / 2,
                                             self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                             self.frame.size.width / self.yj_titleArray.count - _yj_buttonSpacing,
                                             SELECTED_LINE_LAYER_HEIGHT);
}

- (void)buttonAction:(UIButton *)sender {
    
    if (self.yj_toolBarSelectedBlock) {
        
        self.yj_currentButton.selected = NO;
        
        self.yj_currentButton = sender;
        self.yj_currentIndex  = sender.tag;
        
        self.yj_currentButton.selected = YES;
        
        self.yj_toolBarSelectedBlock(sender.tag);
        
        [self selectedLineLayerAnimaction];
    }
}

#pragma mark - Button Width Calculation
//- (CGFloat)caculateButtonWidthWithTitleArray:(NSArray *)titleArray {
//
//    NSInteger titleCount = (NSInteger)titleArray.count;
//
//    NSString *totalStr = @"";
//    for (NSInteger i = 0; i < titleCount; i++) {
//
//        if ([titleArray[i] isKindOfYJass:[NSString YJass]] &&
//            [titleArray[i] length]) {
//
//            totalStr = [totalStr stringByAppendingString:titleArray[i]];
//        }
//    }
//
//    CGFloat totalWidth = (CGFloat)(NSInteger)[totalStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.textFont]} context:nil].size.width + titleCount / 2;
//
//    return totalWidth;
//}

#pragma mark - Init Bottom Line Layer
- (CALayer *)yj_bottomLineLayer {
    
    if (!_yj_bottomLineLayer) {
        
        _yj_bottomLineLayer = [CALayer layer];
        
        _yj_bottomLineLayer.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
        
        _yj_bottomLineLayer.backgroundColor = [UIColor grayColor].CGColor;
    }
    
    return _yj_bottomLineLayer;
}

#pragma mark - Init Selected Line Layer
- (CALayer *)yj_selectedLineLayer {
    
    if (!_yj_selectedLineLayer) {
        
        _yj_selectedLineLayer = [CALayer layer];
        
        _yj_selectedLineLayer.frame = CGRectMake(_yj_buttonSpacing / 2,
                                                 self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                 self.frame.size.width / _yj_titleArray.count - _yj_buttonSpacing,
                                                 SELECTED_LINE_LAYER_HEIGHT);
        
        _yj_selectedLineLayer.backgroundColor = [UIColor blueColor].CGColor;
    }
    
    return _yj_selectedLineLayer;
}

- (void)selectedLineLayerAnimaction {
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.yj_selectedLineLayer.frame = CGRectMake(self.yj_currentButton.frame.origin.x,
                                                                      self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                                      self.frame.size.width / self.yj_titleArray.count - self.yj_buttonSpacing,
                                                                      SELECTED_LINE_LAYER_HEIGHT);
                     }];
}

#pragma mark - Init Button Array
- (NSMutableArray *)yj_buttonArray {
    
    if (!_yj_buttonArray) {
        
        _yj_buttonArray = [NSMutableArray array];
    }
    
    return _yj_buttonArray;
}

#pragma mark -  CALToolBarSeparationStyle
#pragma mark - 设置Separation Color
- (void)setyj_separationColor:(UIColor *)yj_separationColor {
    _yj_separationColor = yj_separationColor;
}

#pragma mark - 设置Separation Width
- (void)setyj_SeparationWidth:(CGFloat)yj_separationWidth {
    _yj_separationWidth = yj_separationWidth;
}


@end
