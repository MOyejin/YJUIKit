//
//  YJAnimatorManager.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_CLASS_AVAILABLE_IOS(10_0) @interface YJAnimatorManager : NSObject

typedef void(^YJAnimatorManagerBlock)(void);
typedef void(^YJAnimatorManagerCompleteBlock)(UIViewAnimatingPosition finalPosition);
typedef void(^YJAnimatorManagerStatusBlock)(UIViewAnimatingState state);

@property (nonatomic, strong, readonly) UIViewPropertyAnimator *yj_viewPropertyAnimator;

#pragma mark - UICubicTimingParameters
/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 */
- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(YJAnimatorManagerBlock)animations
                                  completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param controlPoint1 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 @param controlPoint2 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 */
- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param controlPoint1 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 @param controlPoint2 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(YJAnimatorManagerBlock)animations
                                  completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

#pragma mark - UISpringTimingParameters
/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0 ~ 1.0
 */
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0 ~ 1.0
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(YJAnimatorManagerBlock)animations
                                   completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0~1.0
 @param velocity CGVector, 取值范围为CGVectorMake(0 ~ 1.0, 0 ~ 1.0)
 */
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0~1.0
 @param velocity CGVector, 取值范围为CGVectorMake(0 ~ 1.0, 0 ~ 1.0)
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations
                                   completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param mass CGFloat, 必须大于0
 @param stiffness CGFloat
 @param damping CGFloat
 @param velocity CGVector, 取值范围为CGVectorMake(0 ~ 1.0, 0 ~ 1.0)
 */
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param mass CGFloat, 必须大于0
 @param stiffness CGFloat
 @param damping CGFloat
 @param velocity CGVector
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(YJAnimatorManagerBlock)animations
                                   completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

#pragma mark - UIViewPropertyAnimator
/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param parameters UITimingCurveProvider
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param parameters UITimingCurveProvider
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 @param animations YJAnimatorManagerBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 @param animations YJAnimatorManagerBlock
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param point1 CGPoint
 @param point2 CGPoint
 @param animations YJAnimatorManagerBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param point1 CGPoint
 @param point2 CGPoint
 @param animations YJAnimatorManagerBlock
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param ratio CGFloat
 @param animations YJAnimatorManagerBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(YJAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param ratio CGFloat
 @param animations YJAnimatorManagerBlock
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param delay NSTimeInterval
 @param options UIViewAnimationOptions
 @param animations YJAnimatorManagerBlock
 @param completion YJAnimatorManagerCompleteBlock
 */
- (void)yj_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(YJAnimatorManagerBlock)animations
                                 completion:(YJAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

#pragma mark - UIViewPropertyAnimator控制相关
/**
 开始执行UIViewPropertyAnimator动画
 */
- (void)yj_starViewPropertyAnimator;

/**
 延迟执行UIViewPropertyAnimator动画
 
 @param delay NSTimeInterval
 */
- (void)yj_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay;

/**
 暂停执行UIViewPropertyAnimator动画
 */
- (void)yj_pauseViewPropertyAnimator;

/**
 停止执行UIViewPropertyAnimator动画
 
 @param stop BOOL
 */
- (void)yj_stopViewPropertyAnimator:(BOOL)stop;

/**
 完成并将UIViewPropertyAnimator动画设置为指定的UIViewAnimatingPosition状态
 
 @param position UIViewAnimatingPosition
 */
- (void)yj_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position;


@end

NS_ASSUME_NONNULL_END
