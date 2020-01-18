 
//  UIApplication+YJApplication.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2018/3/5.
//  Copyright © 2018年 Moyejin668. All rights reserved.
//

#import "UIApplication+YJApplication.h"
#import "UIScreen+YJScreen.h"
#import "NSURL+YJURL.h"

#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>
#import <EventKit/EventKit.h>

@implementation UIApplication (YJApplication)

#pragma mark - 权限查询
+ (BOOL)yj_getApplicationLocationPermit {
    
    BOOL yj_authorizedAlways    = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways;
    BOOL yj_authorizedWhenInUse = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse;

    if (yj_authorizedAlways || yj_authorizedWhenInUse) {
        
        return YES;
    }

    return NO;
}

+ (BOOL)yj_getApplicationAddressBookPermit {
    
    if (@available(iOS 9.0, *)) {
        
        BOOL yj_authorizationStatusAuthorized = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized;
        
        return yj_authorizationStatusAuthorized;
        
    } else {
    
        BOOL yj_authorizationStatusAuthorized = ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized;
        
        return yj_authorizationStatusAuthorized;
    }
}

+ (BOOL)yj_getApplicationCameraPermit {
    
    BOOL yj_authorizationStatusAuthorized = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent] == EKAuthorizationStatusAuthorized;
    
    return yj_authorizationStatusAuthorized;
}

+ (BOOL)yj_getApplicationRemindersPermit {
    
    BOOL yj_authorizationStatusAuthorized = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] == EKAuthorizationStatusAuthorized;
    
    return yj_authorizationStatusAuthorized;
}

+ (BOOL)yj_getApplicationPhotosLibraryPermit {
    
    BOOL yj_authorizationStatusAuthorized = [PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized;
    
    return yj_authorizationStatusAuthorized;
}

+ (void)yj_getApplicationMicrophonePermitWithBlock:(YJPermissionBlock)block {

    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        
        if (block) {
            block(granted);
        }
    }];
}

#pragma mark - Open URL
+ (void)yj_callPhoneWithPhoneNumber:(NSString *)phoneNumber {
    
    NSString *yj_tellPhoneNumber = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:yj_tellPhoneNumber]];
}

+ (void)yj_sendEmailWithEmailAddress:(NSString *)emailAddress {
    
    NSString *yj_emailAddress = [NSString stringWithFormat:@"mailto://:%@", emailAddress];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:yj_emailAddress]];
}

+ (void)yj_goToAppSetting {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

#pragma mark - App相关
+ (UIImage *)yj_getApplicationLaunchImage {
    
    UIImage *__block yj_launchImage;
    NSString *yj_interfaceOrientation;
    
    CGSize yj_screenSize = [UIScreen yj_getScreenSize];
    
    UIInterfaceOrientation yj_interfaceProentation = [[self sharedApplication] statusBarOrientation];
    
    if (yj_interfaceProentation == UIInterfaceOrientationLandscapeLeft || yj_interfaceProentation == UIInterfaceOrientationLandscapeRight) {
        
        yj_interfaceOrientation = @"Landscape";
    } else {
        
        yj_interfaceOrientation = @"Portrait";
    }
    
    NSArray<NSDictionary *> *yj_applicationImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    [yj_applicationImages enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGSize yj_imageSize = CGSizeFromString(obj[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(yj_imageSize, yj_screenSize) && [yj_interfaceOrientation isEqualToString:obj[@"UILaunchImageOrientation"]]) {
            
            yj_launchImage = [UIImage imageNamed:obj[@"UILaunchImageName"]];
        }
    }];
    
    return yj_launchImage;
}


#pragma mark - 获取UIStatusBar的高度
+ (CGFloat)yj_getStatusBarHeight {
    
    return [[self sharedApplication] statusBarFrame].size.height;
}

@end
