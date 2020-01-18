 
//  UIBarButtonItem+YJBarButtonItem.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/4/28.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UIBarButtonItem+YJBarButtonItem.h"
#import <objc/runtime.h>

static const void *YJBarButtonItemActionKey = &YJBarButtonItemActionKey;

@interface YJBarButtonItemActionBlock : NSObject

@property (nonatomic, copy) YJBarButtonItemAction yj_barButtonItemAction;

- (instancetype)initBarButtonItemWithActionBlock:(YJBarButtonItemAction)actionBlock;
- (void)yj_invokeWithBarButtonItem:(UIBarButtonItem *)barButtonItem;

@end

@implementation YJBarButtonItemActionBlock

- (instancetype)initBarButtonItemWithActionBlock:(YJBarButtonItemAction)actionBlock {
    
    self = [super init];
    
    if (self) {
        
        self.yj_barButtonItemAction = [actionBlock copy];
    }
    
    return self;
}

- (void)yj_invokeWithBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    if (self.yj_barButtonItemAction) {
        self.yj_barButtonItemAction(barButtonItem);
    }
}

@end

@implementation UIBarButtonItem (YJBarButtonItem)

- (void)setyj_barButtonItemAction:(YJBarButtonItemAction)yj_barButtonItemAction {
    
    YJBarButtonItemActionBlock *yj_barButtonItemActionBlock = [[YJBarButtonItemActionBlock alloc] initBarButtonItemWithActionBlock:yj_barButtonItemAction];
    
    objc_setAssociatedObject(self, &YJBarButtonItemActionKey, yj_barButtonItemActionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTarget:yj_barButtonItemActionBlock];
    [self setAction:@selector(yj_invokeWithBarButtonItem:)];
}

- (YJBarButtonItemAction)yj_barButtonItemAction {
    
    YJBarButtonItemActionBlock *yj_barButtonItemActionBlock = objc_getAssociatedObject(self, &YJBarButtonItemActionKey);

    return yj_barButtonItemActionBlock.yj_barButtonItemAction;
}

@end
