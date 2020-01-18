//
//  UIControl+YJControl.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/19.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YJControlAction)(id sender);

@interface YJControlActionBlockObject : NSObject

/**
 YJControlAction Typedef
 */
@property (nonatomic, copy) YJControlAction yj_controlAction;

/**
 UIControlEvents枚举
 */
@property (nonatomic, assign) UIControlEvents yj_controlEvents;

/**
 YJControlActionBlockObject的Action事件

 @param sender id
 */
- (void)yj_controlInvokeBlock:(id)sender;

@end

@interface UIControl (YJControl)

/**
 给UIControl添加Action事件

 @param controlEvents UIControlEvents
 @param complete YJControlAction
 */
- (void)yj_addControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(YJControlAction)complete;

/**
 设置UIControl的Action事件

 @param controlEvents UIControlEvents
 @param complete YJControlAction
 */
- (void)yj_setControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(YJControlAction)complete;

/**
 删除UIControl的Action事件

 @param controlEvents UIControlEvents
 */
- (void)yj_removeControlActionWithEvents:(UIControlEvents)controlEvents;

/**
 删除所有的Action事件
 */
- (void)yj_removeAllActions;

@end
