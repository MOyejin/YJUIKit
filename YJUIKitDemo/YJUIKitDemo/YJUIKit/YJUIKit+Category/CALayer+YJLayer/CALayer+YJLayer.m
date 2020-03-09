//
//  CALayer+YJLayer.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/9/19.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "CALayer+YJLayer.h"

@implementation CALayer (YJLayer)

- (void)yj_sendLayerBackWithSubLayer:(CALayer *)sublayer {
    
    if (sublayer.superlayer == self) {
        
        [sublayer removeFromSuperlayer];
        
        [self insertSublayer:sublayer
                     atIndex:0];
    }
}

- (void)yj_bringLayerFrontWithSublayer:(CALayer *)sublayer {
    
    if (sublayer.superlayer == self) {
        
        [sublayer removeFromSuperlayer];
        
        [self insertSublayer:sublayer
                     atIndex:(unsigned)self.sublayers.count];
    }
}

@end
