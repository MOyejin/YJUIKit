//
//  UIControl+YJControl.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/19.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UIControl+YJControl.h"
#import <objc/runtime.h>

static const void *YJControlActionBlockArray = &YJControlActionBlockArray;

static const void *YJControlActionKey = &YJControlActionKey;

@implementation YJControlActionBlockObject

- (void)yj_controlInvokeBlock:(id)sender {
    
    if (self.yj_controlAction) {
        
        self.yj_controlAction(sender);
    }
}

@end

@implementation UIControl (YJControl)

- (void)yj_addControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(YJControlAction)complete {
 
    NSMutableArray *yj_controlActionBlockArray = [self yj_controlActionBlockArray];
    
    YJControlActionBlockObject *yj_controlActionBlockObject = [[YJControlActionBlockObject alloc] init];
    
    yj_controlActionBlockObject.yj_controlAction = complete;
    yj_controlActionBlockObject.yj_controlEvents = controlEvents;
    
    [yj_controlActionBlockArray addObject:complete];
    
    [self addTarget:self
             action:@selector(yj_controlInvokeBlock:)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)yj_setControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(YJControlAction)complete {
    
    [self yj_removeControlActionWithEvents:UIControlEventAllEvents];
    [self yj_addControlActionWithEvents:controlEvents
                               complete:complete];
}

- (void)yj_removeControlActionWithEvents:(UIControlEvents)controlEvents {
    
    NSMutableArray *yj_controlActionBlockArray = [self yj_controlActionBlockArray];
    NSMutableArray *yj_controlActionObjectArray = [NSMutableArray arrayWithCapacity:yj_controlActionBlockArray.count];

    [yj_controlActionBlockArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YJControlActionBlockObject *yj_controlActionBlockObject = obj;
        
        if (yj_controlActionBlockObject.yj_controlEvents == controlEvents) {
            
            [yj_controlActionObjectArray addObject:yj_controlActionBlockObject];
            
            [self removeTarget:yj_controlActionBlockObject
                        action:@selector(yj_controlInvokeBlock:)
              forControlEvents:controlEvents];
        }
    }];
    
    [yj_controlActionBlockArray removeObjectsInArray:yj_controlActionObjectArray];
}

- (void)yj_removeAllActions {
    
    [[self allTargets] enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [self removeTarget:obj
                    action:NULL
          forControlEvents:UIControlEventAllEvents];
    }];
    
    [[self yj_controlActionBlockArray] removeAllObjects];
}

- (NSMutableArray *)yj_controlActionBlockArray {
    
    NSMutableArray *yj_controlActionBlocksArray = objc_getAssociatedObject(self, YJControlActionBlockArray);
    
    if (!yj_controlActionBlocksArray) {
    
        yj_controlActionBlocksArray = [NSMutableArray array];
        
        objc_setAssociatedObject(self, YJControlActionBlockArray, yj_controlActionBlocksArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return yj_controlActionBlocksArray;
}

@end
