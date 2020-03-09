//
//  YJTextField.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YJTextFieldType) {
    
    YJTextFieldBottomNormal = 0, // default
    YJTextFieldBottomLineType
};

@interface YJTextField : UITextField

/**
 YJTextFieldType, 默认为YJTextFieldBottomNormal
 */
@property (nonatomic, assign) YJTextFieldType yj_textFieldType;

/**
 YJTextField下划线的颜色, 只有在YJTextFieldBottomLineType下才会生效
 */
@property (nonatomic, strong) UIColor *yj_lineColor;


@end

NS_ASSUME_NONNULL_END
