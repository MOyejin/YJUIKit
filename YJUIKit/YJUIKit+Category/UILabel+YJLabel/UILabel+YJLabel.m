 
//  UILabel+YJLabel.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2019/1/7.
//  Copyright © 2019 Moyejin668. All rights reserved.
//

#import "UILabel+YJLabel.h"
#import "UIView+YJView.h"

@implementation UILabel (YJLabel)

- (CGFloat)yj_getLabelLineHeight {
    
    if (!self.text.length) {
    
        return 0;
    }
    
    NSString *yj_rangeString = [self.text substringWithRange:NSMakeRange(0, 1)];
    
    CGSize yj_rowSize = [yj_rangeString sizeWithAttributes:@{NSFontAttributeName:self.font}];
    
    return yj_rowSize.height;
}

- (CGFloat)yj_getLabelTextHeight {
    
    CGSize yj_textSize = [self textRectForBounds:CGRectMake(0, 0, self.yj_width, 10000)
                          limitedToNumberOfLines:self.numberOfLines].size;
    
    return yj_textSize.height;
}

- (CGFloat)yj_getLabelTextWidth {
    
    CGSize yj_textSize = [self textRectForBounds:CGRectMake(0, 0, self.yj_width, 10000)
                          limitedToNumberOfLines:self.numberOfLines].size;
    
    return yj_textSize.width;
}

- (NSInteger)yj_getLabelNumberOfLines {
    
    CGSize yj_contentSize = [self.text boundingRectWithSize:CGSizeMake(self.yj_width, 10000)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName:self.font}
                                                    context:nil].size;
    
    return yj_contentSize.height / [self yj_getLabelLineHeight];
}

- (CGSize)yj_fitLabelSizeForLimitedSize:(CGSize)size {
    
    CGRect yj_labelFrame = CGRectMake(self.frame.origin.x,
                                      self.frame.origin.y,
                                      size.width,
                                      size.height);
    
    self.frame = yj_labelFrame;
    
    CGFloat yj_labelHeight = ([self yj_getLabelTextHeight] > size.height) ? size.height : [self yj_getLabelTextHeight];
    
    return CGSizeMake([self yj_getLabelTextWidth], yj_labelHeight);
}

@end
