
//  UIFont+YJFont.m
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020年 Moyejin668. All rights reserved.
//

#import "UIFont+YJFont.h"
#import "UIScreen+YJScreen.h"
#import <CoreText/CoreText.h>

@implementation UIFont (YJFont)

+ (UIFont *)yj_fitSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:[UIScreen yj_fitScreen:fontSize]];
}
    
+ (UIFont *)yj_fitPlusSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:[UIScreen yj_fitPlusScreen:fontSize]];
}

+ (UIFont *)yj_fitBoldSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont boldSystemFontOfSize:[UIScreen yj_fitScreen:fontSize]];
}

+ (UIFont *)yj_fitPlusBoldSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont boldSystemFontOfSize:[UIScreen yj_fitPlusScreen:fontSize]];
}

+ (UIFont *)yj_fitItalicSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont italicSystemFontOfSize:[UIScreen yj_fitScreen:fontSize]];
}

+ (UIFont *)yj_fitPlusItalicSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont italicSystemFontOfSize:[UIScreen yj_fitPlusScreen:fontSize]];
}

+ (UIFont *)yj_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2) {

    return [UIFont systemFontOfSize:[UIScreen yj_fitScreen:fontSize]
                             weight:[UIScreen yj_fitScreen:weight]];
}

+ (UIFont *)yj_fitPlusSystemFontOfSize:(CGFloat)fontSize
                                weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2) {
    
    return [UIFont systemFontOfSize:[UIScreen yj_fitPlusScreen:fontSize]
                             weight:[UIScreen yj_fitPlusScreen:weight]];
}

+ (UIFont *)yj_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0) {
    
    return [UIFont monospacedDigitSystemFontOfSize:[UIScreen yj_fitScreen:fontSize]
                                            weight:[UIScreen yj_fitScreen:weight]];
}

+ (UIFont *)yj_fitPlusMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                               weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0) {
    
    return [UIFont monospacedDigitSystemFontOfSize:[UIScreen yj_fitPlusScreen:fontSize]
                                            weight:[UIScreen yj_fitPlusScreen:weight]];
}

#pragma mark - 自定义字体
+ (BOOL)yj_loadFontWithPath:(NSString *)path {
    
    NSURL *yj_url = [NSURL fileURLWithPath:path];
    
    CFErrorRef yj_errorRef;
    
    BOOL yj_success = CTFontManagerRegisterFontsForURL((__bridge CFTypeRef)yj_url, kCTFontManagerScopeNone, &yj_errorRef);
    
    return yj_success;
}

+ (void)yj_unloadFontWithPath:(NSString *)path {
    
    NSURL *yj_url = [NSURL fileURLWithPath:path];
    
    CTFontManagerUnregisterFontsForURL((__bridge CFTypeRef)yj_url, kCTFontManagerScopeNone, NULL);
}

+ (UIFont *)yj_loadFontWithData:(NSData *)data {
    
    CGDataProviderRef yj_dataProviderRef = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    if (!yj_dataProviderRef) {
        return nil;
    }
    
    CGFontRef yj_fontRef = CGFontCreateWithDataProvider(yj_dataProviderRef);
    CGDataProviderRelease(yj_dataProviderRef);
    
    if (!yj_fontRef) {
        return nil;
    }
    
    CFErrorRef yj_errorRef;
    
    BOOL yj_success = CTFontManagerRegisterGraphicsFont(yj_fontRef, &yj_errorRef);
    
    if (!yj_success) {
        
        CFRelease(yj_fontRef);
        
        NSLog(@"%@", yj_errorRef);
        
        return nil;
        
    } else {
        
        CFStringRef fontName = CGFontCopyPostScriptName(yj_fontRef);
        
        UIFont *font = [UIFont fontWithName:(__bridge NSString *)(fontName)
                                       size:[UIFont systemFontSize]];
        
        if (fontName) {
            
            CFRelease(fontName);
        }
        
        CGFontRelease(yj_fontRef);
        
        return font;
    }
}

+ (BOOL)yj_unloadFontWithData:(UIFont *)font {
    
    CGFontRef yj_fontRef = CGFontCreateWithFontName((__bridge CFStringRef)font.fontName);
    
    if (!yj_fontRef) {
        
        return NO;
    }
    
    CFErrorRef yj_errorRef;
    
    BOOL yj_success = CTFontManagerUnregisterGraphicsFont(yj_fontRef, &yj_errorRef);
    
    CFRelease(yj_fontRef);
    
    if (!yj_success) {
        
        NSLog(@"%@", yj_errorRef);
    }
    
    return yj_success;
}

+ (UIFont *)yj_fitCustomFontWithName:(NSString *)name
                            fontSize:(CGFloat)fontSize {
    
    return [UIFont fontWithName:name
                           size:[UIScreen yj_fitScreen:fontSize]];
}
    
+ (UIFont *)yj_fitPlusCustomFontWithName:(NSString *)name
                                fontSize:(CGFloat)fontSize {
    
    return [UIFont fontWithName:name
                           size:[UIScreen yj_fitPlusScreen:fontSize]];
}


@end
