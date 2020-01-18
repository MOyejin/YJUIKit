//
//  YJAnimatorManager.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJAnimatorManager.h"

@interface YJAnimatorManager ()

@property (nonatomic, strong, readwrite) UIViewPropertyAnimator *yj_viewPropertyAnimator;

@end

@implementation YJAnimatorManager

#pragma mark - UICubicTimingParameters
- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_cubicTimingParametersWithDuration:duration
                                         curve:curve
                                    animations:animations
                                    completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(YJAnimatorManagerBlock)animations
                                  completion:(YJAnimatorManagerCompleteBlock)completion {
    
    UICubicTimingParameters *yj_cubicTimingParameters = [[UICubicTimingParameters alloc] initWithAnimationCurve:curve];
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:yj_cubicTimingParameters];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_cubicTimingParametersWithDuration:duration
                                 controlPoint1:controlPoint1
                                 controlPoint2:controlPoint2
                                    animations:animations
                                    completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(YJAnimatorManagerBlock)animations
                                  completion:(YJAnimatorManagerCompleteBlock)completion {
    
    UICubicTimingParameters *yj_cubicTimingParameters = [[UICubicTimingParameters alloc] initWithControlPoint1:controlPoint1
                                                                                                 controlPoint2:controlPoint2];
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:yj_cubicTimingParameters];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

#pragma mark - UISpringTimingParameters
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_springTimingParametersWithDuration:duration
                                   dampingRatio:dampingRatio
                                     animations:animations
                                     completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(YJAnimatorManagerBlock)animations
                                   completion:(YJAnimatorManagerCompleteBlock)completion {
    
    UISpringTimingParameters *yj_springTimingParameters = [[UISpringTimingParameters alloc] initWithDampingRatio:dampingRatio];
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:yj_springTimingParameters];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_springTimingParametersWithDuration:duration
                                   dampingRatio:dampingRatio
                                       velocity:velocity
                                     animations:animations
                                     completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations
                                   completion:(YJAnimatorManagerCompleteBlock)completion {
    
    UISpringTimingParameters *yj_springTimingParameters = [[UISpringTimingParameters alloc] initWithDampingRatio:dampingRatio
                                                                                                 initialVelocity:velocity];
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:yj_springTimingParameters];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_springTimingParametersWithDuration:duration
                                           mass:mass
                                      stiffness:stiffness
                                        damping:damping
                                       velocity:velocity
                                     animations:animations
                                     completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations
                                   completion:(YJAnimatorManagerCompleteBlock)completion {
    
    UISpringTimingParameters *yj_springTimingParameters = [[UISpringTimingParameters alloc] initWithMass:mass
                                                                                               stiffness:stiffness
                                                                                                 damping:damping
                                                                                         initialVelocity:velocity];
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:yj_springTimingParameters];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

#pragma mark - UIViewPropertyAnimator
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_viewPropertyAnimatorWithDuration:duration
                             timingParameters:parameters
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion {
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:parameters];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_viewPropertyAnimatorWithDuration:duration
                                 dampingRatio:curve
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion {
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                              curve:curve
                                                                         animations:animations];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_viewPropertyAnimatorWithDuration:duration
                                controlPoint1:point1
                                controlPoint2:point2
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion {
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                      controlPoint1:point1
                                                                      controlPoint2:point2
                                                                         animations:animations];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(YJAnimatorManagerBlock)animations {
    
    [self yj_viewPropertyAnimatorWithDuration:duration
                                 dampingRatio:ratio
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion {
    
    self.yj_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                       dampingRatio:ratio
                                                                         animations:animations];
    
    [self.yj_viewPropertyAnimator addAnimations:animations];
    [self.yj_viewPropertyAnimator addCompletion:completion];
}

- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion {
    
    self.yj_viewPropertyAnimator = [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:duration
                                                                                         delay:delay
                                                                                       options:options
                                                                                    animations:animations
                                                                                    completion:completion];
}

#pragma mark - UIViewPropertyAnimator控制相关
- (void)yj_starViewPropertyAnimator {
    
    [self.yj_viewPropertyAnimator startAnimation];
}

- (void)yj_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay {
    
    [self.yj_viewPropertyAnimator startAnimationAfterDelay:delay];
}

- (void)yj_pauseViewPropertyAnimator {
    
    [self.yj_viewPropertyAnimator pauseAnimation];
}

- (void)yj_stopViewPropertyAnimator:(BOOL)stop {
    
    [self.yj_viewPropertyAnimator stopAnimation:stop];
}

- (void)yj_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position {
    
    [self.yj_viewPropertyAnimator finishAnimationAtPosition:position];
}

@end
