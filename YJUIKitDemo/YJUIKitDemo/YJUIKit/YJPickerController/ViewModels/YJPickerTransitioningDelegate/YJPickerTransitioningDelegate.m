//
//  YJPickerTransitioningDelegate.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPickerTransitioningDelegate.h"
#import "YJPresentationController.h"

@implementation YJPickerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source {
    
    YJPresentationController *yj_presentationController = [[YJPresentationController alloc] initWithPresentedViewController:presented
                                                                                                   presentingViewController:presenting];
    
    return yj_presentationController;
}


@end
