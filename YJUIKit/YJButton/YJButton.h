//
//  YJButton.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJButtonStyle) {
    
    YJButtonImageTopStyle = 0,
    YJButtonImageLeftStyle,
    YJButtonImageBottomStyle,
    YJButtonImageRightStyle
};

@interface YJButton : UIButton

/**
 设置图片显示的样式
 */
@property (nonatomic, assign) YJButtonStyle yj_buttomImageStyle;

/**
 图片与文字之间的间距, 默认: 10
 */
@property (nonatomic, assign) CGFloat yj_imageSpacing;

/**
 设置图片的尺寸
 */
@property (nonatomic, assign) CGSize yj_imageSize;


@end

NS_ASSUME_NONNULL_END
