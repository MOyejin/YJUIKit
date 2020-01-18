 
//  UILabel+YJLabel.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2019/1/7.
//  Copyright © 2019 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YJLabel)

- (CGFloat)yj_getLabelLineHeight;
- (CGFloat)yj_getLabelTextHeight;
- (CGFloat)yj_getLabelTextWidth;

- (NSInteger)yj_getLabelNumberOfLines;

- (CGSize)yj_fitLabelSizeForLimitedSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
