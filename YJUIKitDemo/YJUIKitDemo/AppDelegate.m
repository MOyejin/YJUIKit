//
//  AppDelegate.m
//  YJUIKitDemo
//
//  Created by EStrongerE023 on 2020/3/6.
//  Copyright © 2020 EStrongerE023. All rights reserved.
//

#import "AppDelegate.h"
#import "YJUIKit.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window {
    
    YJ_GET_METHOD_RETURN_OBJC(_window);
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.backgroundColor = [UIColor whiteColor];
    
    return _window;
}

- (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return image;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    YJNavigationController *es_navigationController               = [[YJNavigationController alloc]
                                                                     initWithRootViewController:[ViewController new]];
    
    es_navigationController.yj_shadowImage                        = [UIImage new];
    es_navigationController.yj_tintColor                          = [UIColor blackColor];
    es_navigationController.yj_foregroundColor                    = [UIColor blackColor];
    es_navigationController.yj_backgroundImage                    = [self imageWithColor:[UIColor blackColor]];
    
    //        es_navigationController.navigationBar.barTintColor = ESBlackColor;
    
    [UIApplication sharedApplication].statusBarStyle              = UIStatusBarStyleLightContent;
    
    [UINavigationBar appearance].translucent                      = NO;
    [UINavigationBar appearance].backIndicatorImage               = [[UIImage imageNamed:@"Nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [[UIImage imageNamed:@"Nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor blackColor]];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont yj_fitSystemFontOfSize:35]}
                                                forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont yj_fitSystemFontOfSize:35]}
                                                forState:UIControlStateHighlighted];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],
                                                       NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                        [UIColor blackColor],
                                                        NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateSelected];
    

    self.window.rootViewController          = es_navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
