 
//  UIBarButtonItem+YJBarButtonItem.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/4/28.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YJBarButtonItemAction)(UIBarButtonItem *sender);

NS_ASSUME_NONNULL_BEGIN
@interface UIBarButtonItem (YJBarButtonItem)

@property (nullable, nonatomic, copy) YJBarButtonItemAction yj_barButtonItemAction;


@end
NS_ASSUME_NONNULL_END
