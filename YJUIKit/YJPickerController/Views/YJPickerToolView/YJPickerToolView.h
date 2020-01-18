//
//  YJPickerToolView.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJPickerToolView : UIView

@property (nonatomic, strong, readonly) UIButton *yj_cancelButton;
@property (nonatomic, strong, readonly) UIButton *yj_defineButton;

@property (nonatomic, strong, readonly) UILabel *es_titleLabel;

@property (nonatomic, copy) void(^yj_pickerToolViewDefineActionBlock)(void);
@property (nonatomic, copy) void(^yj_pickerToolViewCancelActionBlock)(void);


@end

NS_ASSUME_NONNULL_END
