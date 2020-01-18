//
//  UIScrollView+YJScrollView.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/27.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UIScrollView+YJScrollView.h"

@implementation UIScrollView (YJScrollView)

- (void)yj_scrollViewToTopWithAnimated:(BOOL)animated {
    
    [self setContentOffset:CGPointMake(0, 0)
                  animated:animated];
}

- (void)yj_scrollViewToLeftWithAnimated:(BOOL)animated {
    
    [self setContentOffset:CGPointMake(0, self.contentInset.left)
                  animated:animated];
}

- (void)yj_scrollViewToBottomWithAnimated:(BOOL)animated {
    
    CGFloat yj_scrollViewBottom = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;

    [self setContentOffset:CGPointMake(0, yj_scrollViewBottom)
                  animated:animated];
}

- (void)yj_scrollViewToRightWithAnimated:(BOOL)animated {
    
    CGFloat yj_scrollViewRight = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    
    [self setContentOffset:CGPointMake(0, yj_scrollViewRight)
                  animated:animated];
}

@end
