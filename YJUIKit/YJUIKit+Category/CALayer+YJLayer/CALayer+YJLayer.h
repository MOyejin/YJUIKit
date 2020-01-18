//
//  CALayer+YJLayer.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/9/19.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (YJLayer)

/**
 把指定的CALayer排序到所有CALayer的最后面

 @param sublayer CALayer
 */
- (void)yj_sendLayerBackWithSubLayer:(CALayer *)sublayer;

/**
 把指定的CALayer排序到所有CALayer的前面

 @param sublayer CALayer
 */
- (void)yj_bringLayerFrontWithSublayer:(CALayer *)sublayer;

@end

NS_ASSUME_NONNULL_END
