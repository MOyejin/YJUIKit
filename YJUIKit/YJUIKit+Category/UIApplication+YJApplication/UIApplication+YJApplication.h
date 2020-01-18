 
//  UIApplication+YJApplication.h
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/5.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YJPermissionBlock)(BOOL granted);

@interface UIApplication (YJApplication)

#pragma mark - 权限查询
/**
 获取UIApplication的定位是否授权

 @return BOOL
 */
+ (BOOL)yj_getApplicationLocationPermit;

/**
 获取UIApplication的通信录是否授权

 @return BOOL
 */
+ (BOOL)yj_getApplicationAddressBookPermit;

/**
 获取UIApplication的相机是否授权
 
 @return BOOL
 */
+ (BOOL)yj_getApplicationCameraPermit;

/**
 获取UIApplication的推送功能是否授权
 
 @return BOOL
 */
+ (BOOL)yj_getApplicationRemindersPermit;

/**
 获取UIApplication的相册是否授权

 @return BOOL
 */
+ (BOOL)yj_getApplicationPhotosLibraryPermit;

/**
 获取UIApplication的麦克风是否开启

 @param block YJPermissionBlock
 */
+ (void)yj_getApplicationMicrophonePermitWithBlock:(YJPermissionBlock)block;

#pragma mark - Open URL
/**
 给指定的手机号码拨打电话

 @param phoneNumber NSString
 */
+ (void)yj_callPhoneWithPhoneNumber:(NSString *)phoneNumber;

/**
 给指定的邮箱地址发邮件

 @param emailAddress NSString
 */
+ (void)yj_sendEmailWithEmailAddress:(NSString *)emailAddress;

/**
 打开App的系统设置页面
 */
+ (void)yj_goToAppSetting;

#pragma mark - App相关
/**
 获取App启动图

 @return UIImage
 */
+ (UIImage *)yj_getApplicationLaunchImage;

/**
 获取UIStatusBar的高度
 
 @return CGFloat
 */
+ (CGFloat)yj_getStatusBarHeight;

@end
