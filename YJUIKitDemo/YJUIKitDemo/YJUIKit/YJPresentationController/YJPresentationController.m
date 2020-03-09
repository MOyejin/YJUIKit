//
//  YJPresentationController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJPresentationController.h"
#import "UIViewController+YJViewController.h"

@interface YJPresentationController ()

@property (nonatomic, strong) UIView *yj_presentationView;

@property (nonatomic, strong) UIVisualEffectView *yj_visualEffectView;

@property (nonatomic, strong) UITapGestureRecognizer *yj_tapGestureRecognizer;

@end

@implementation YJPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                       presentingViewController:(UIViewController *)presentingViewController {
    
    self = [super initWithPresentedViewController:presentedViewController
                         presentingViewController:presentingViewController];
    
    if (self) {
        
        BOOL yj_isHasPresentationViewHeight = (presentedViewController.yj_presentationViewHeight == 0);

        self.yj_backgroundColor            = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.yj_animationDuration          = 0.5f;
        self.yj_presentationViewStyle      = YJPresentationViewStyleNormal;
        self.yj_presentationViewHeight     = yj_isHasPresentationViewHeight ? [UIScreen mainScreen].bounds.size.height : presentedViewController.yj_presentationViewHeight;
        self.yj_isNeedTapGestureRecognizer = YES;
    }
    
    return self;
}

#pragma mark - Presentation Transition
- (void)presentationTransitionWillBegin {
    [super presentationTransitionWillBegin];
    
    [self yj_addPresentationView];
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    [super presentationTransitionDidEnd:completed];
}

- (void)yj_addPresentationView {
    
    if (self.yj_presentationViewStyle == YJPresentationViewStyleNormal) {
        
        [self.containerView addSubview:self.yj_presentationView];
    } else {
        
        [self.containerView addSubview:self.yj_visualEffectView];
    }
    
    [UIView animateWithDuration:self.yj_animationDuration
                     animations:^{
                         
                         if (self.yj_presentationViewStyle == YJPresentationViewStyleNormal) {
                             
                             self.yj_presentationView.alpha = 1.0f;
                         } else {
                             
                             self.yj_visualEffectView.alpha = 0.9f;
                         }
                     }];
}

#pragma mark - dismissal Transition
- (void)dismissalTransitionWillBegin {
    [super dismissalTransitionWillBegin];
    
    [self yj_removePresentationViewBegin];
}

- (void)yj_removePresentationViewBegin {
    
    [UIView animateWithDuration:self.yj_animationDuration
                     animations:^{
                         
                         if (self.yj_presentationViewStyle == YJPresentationViewStyleNormal) {
                             
                             self.yj_presentationView.alpha = 0.f;
                         } else {
                             self.yj_visualEffectView.alpha = 0.f;
                         }
                     }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [super dismissalTransitionDidEnd:completed];
    
    [self yj_removePresentationViewWithCompleted:completed];
}

- (void)yj_removePresentationViewWithCompleted:(BOOL)completed {
    
    if (completed) {
        
        if (self.yj_presentationViewStyle == YJPresentationViewStyleNormal) {
            
            [self.yj_presentationView removeFromSuperview];
        } else {
            [self.yj_visualEffectView removeFromSuperview];
        }
    }
}

#pragma mark - 设置Frame
- (CGRect)frameOfPresentedViewInContainerView {
    
    CGSize yj_screenSize =  [UIScreen mainScreen].bounds.size;
    
    return CGRectMake(0,
                      yj_screenSize.height - self.yj_presentationViewHeight,
                      yj_screenSize.width,
                      self.yj_presentationViewHeight);
}

#pragma mark - UIView
- (UIView *)yj_presentationView {
    
    if (!_yj_presentationView) {
        
        _yj_presentationView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        
        _yj_presentationView.backgroundColor = self.yj_backgroundColor;
        
        if (self.yj_isNeedTapGestureRecognizer) {
            
            [_yj_presentationView addGestureRecognizer:self.yj_tapGestureRecognizer];
        }
    }
    
    return _yj_presentationView;
}

#pragma mark - UIVisualEffectView
- (UIVisualEffectView *)yj_visualEffectView {
    
    if (!_yj_visualEffectView) {
        
        UIBlurEffect *yj_blurEffect = [UIBlurEffect effectWithStyle:self.yj_blurEffectStyle];
        
        _yj_visualEffectView = [[UIVisualEffectView alloc] initWithEffect:yj_blurEffect];
        
        _yj_visualEffectView.frame = self.containerView.bounds;
        _yj_visualEffectView.alpha = 0.f;
        
        if (self.yj_isNeedTapGestureRecognizer) {
            
            [_yj_visualEffectView addGestureRecognizer:self.yj_tapGestureRecognizer];
        }
    }
    
    return _yj_visualEffectView;
}

#pragma mark - 添加单击手势
- (UITapGestureRecognizer *)yj_tapGestureRecognizer {
    
    if (!_yj_tapGestureRecognizer) {
        
        _yj_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(yj_containerViewTapActionWithTapGestureRecognizer:)];
    }
    
    return _yj_tapGestureRecognizer;
}

- (void)yj_containerViewTapActionWithTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    CGPoint yj_presentationViewPoint = [tapGestureRecognizer locationInView:self.yj_presentationView];
    CGPoint yj_visualEffectViewPoint = [tapGestureRecognizer locationInView:self.yj_visualEffectView];
    
    BOOL yj_isPresentationViewRectContainsPoint = CGRectContainsPoint([self frameOfPresentedViewInContainerView],
                                                                      yj_presentationViewPoint);
    BOOL yj_isVisualEffectViewRectContainsPoint = CGRectContainsPoint([self frameOfPresentedViewInContainerView],
                                                                      yj_visualEffectViewPoint);
    
    if (!yj_isPresentationViewRectContainsPoint || !yj_isVisualEffectViewRectContainsPoint) {
        
        [self.presentedViewController dismissViewControllerAnimated:YES
                                                         completion:nil];
    }
}


@end
