 
//  UINavigationItem+YJNavigationItem.m
//  Example
//
//  Created by Mac on 2020/1/16.
//  Copyright © 2020年 MOyejin   All rights reserved.
//

#import "UINavigationItem+YJNavigationItem.h"
#import "NSObject+YJObject.h"

static void *yj_backButtonItemKey = &yj_backButtonItemKey;

@implementation UINavigationItem (YJNavigationItem)

+ (void)initialize {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self yj_exchangeImplementationsWithClass:[self class]
                                 originalSelector:@selector(backBarButtonItem)
                                 swizzledSelector:@selector(yj_backBarButtonItem)];
    });
}

- (UIBarButtonItem *)backBarButtonItem {
    
    return [[UIBarButtonItem alloc] initWithTitle:@""
                                            style:UIBarButtonItemStylePlain
                                           target:nil
                                           action:NULL];
}

- (void)dealloc {
    objc_removeAssociatedObjects(self);
}

- (UIBarButtonItem *)yj_backBarButtonItem {
    
    UIBarButtonItem *yj_backItem = [self yj_backBarButtonItem];
    
    if (yj_backItem) {
        
        return yj_backItem;
    }
    
    yj_backItem = objc_getAssociatedObject(self, &yj_backButtonItemKey);
    
    if (!yj_backItem) {
        
        yj_backItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                       style:UIBarButtonItemStylePlain
                                                      target:nil
                                                      action:NULL];
        
        objc_setAssociatedObject(self, &yj_backButtonItemKey, yj_backItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return yj_backItem;
}

@end
