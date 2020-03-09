 
//  UIColor+YJColor.m
//
//  Created by Moyejin668 on 11/10/16.
//  Copyright © 2016年 Moyejin668. All rights reserved.
//

#import "UIColor+YJColor.h"

@implementation UIColor (YJColor)

#pragma mark - 随机颜色
+ (UIColor *)yj_getARC4RandomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0
                           green:arc4random_uniform(256)/255.0
                            blue:arc4random_uniform(256)/255.0
                           alpha:1.0];
}

#pragma mark - 十六进制颜色值
+ (UIColor *)yj_colorWithHex:(NSInteger)hexValue {
    return [UIColor yj_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)yj_colorWithHex:(NSInteger)hexValue
                    alpha:(CGFloat)alphaValue {
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alphaValue];
}

+ (UIColor *)yj_colorWithHexString:(NSString *)hexString {
    
    return [self yj_getColorWithHexString:hexString
                                    alpha:1.0f];
}


+ (UIColor *)yj_colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alphaValue {
    
    return [self yj_getColorWithHexString:hexString
                                    alpha:alphaValue];
}

+ (UIColor *)yj_getColorWithHexString:(NSString *)hexString
                                alpha:(CGFloat)alphaValue {
    
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([colorString length] < 6) {
        
        return [UIColor blackColor];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        
        colorString = [colorString substringFromIndex:1];
    }
    
    if ([colorString length] != 6) {
        
        return [UIColor blackColor];
    }
    
    NSRange range;
    
    range.location = 0;
    range.length = 2;
    
    NSString *redString = [colorString substringWithRange:range];
    
    range.location = 2;
    
    NSString *greenString = [colorString substringWithRange:range];
    
    range.location = 4;
    
    NSString *blueString = [colorString substringWithRange:range];
    
    unsigned int red, green, blue;
    
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    return [UIColor colorWithRed:((float) red / 255.0f)
                           green:((float) green / 255.0f)
                            blue:((float) blue / 255.0f)
                           alpha:1.0f];
}

#pragma mark - 三原色
+ (UIColor *)yj_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f
                           alpha:alpha];
}

+ (UIColor *)yj_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue {
    
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f
                           alpha:1.0f];
}

#pragma mark - 设置渐变色
+ (UIColor *)yj_configGradientWithBeginColor:(UIColor *)beginColor
                                    endColor:(UIColor *)endColor
                                      height:(CGFloat)height {
    
    CGSize yj_colorSize = CGSizeMake(1, height);
    
    UIGraphicsBeginImageContextWithOptions(yj_colorSize, NO, 0);
    
    CGContextRef yj_contextRef = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef yj_colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    NSArray *yj_colorArray = @[(id)beginColor.CGColor,
                               (id)endColor.CGColor];
    
    CGGradientRef yj_gradientRef = CGGradientCreateWithColors(yj_colorSpaceRef,
                                                              (__bridge CFArrayRef)yj_colorArray,
                                                              NULL);
    CGContextDrawLinearGradient(yj_contextRef,
                                yj_gradientRef,
                                CGPointMake(0, 0),
                                CGPointMake(0, yj_colorSize.height),
                                0);
    
    UIImage *yj_gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(yj_gradientRef);
    CGColorSpaceRelease(yj_colorSpaceRef);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:yj_gradientImage];
}

@end
