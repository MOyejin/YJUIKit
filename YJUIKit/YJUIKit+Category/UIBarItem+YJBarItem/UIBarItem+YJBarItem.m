//
//  UIBarItem+YJBarItem.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/9/19.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UIBarItem+YJBarItem.h"

@implementation UIBarItem (YJBarItem)

- (UIView *)yj_barItemView {
    return [self valueForKey:@"view"];
}

@end
