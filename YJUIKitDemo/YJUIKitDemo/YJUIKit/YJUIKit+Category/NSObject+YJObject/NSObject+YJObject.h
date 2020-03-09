//
//  NSObject+YJObject.h
//  YJFoundationDemo
//
//  Created by Moyejin168 on 2020/1/15.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YJObject)(void);
typedef void(^YJObjectKVOBlock)(__weak id obj, id oldValue, id newValue);

@interface NSObject (YJObject)

#pragma mark - Runtime
/**
 交换两个实例方法
 
 @param class Clss类
 @param originalSelector 被交换方法
 @param swizzledSelector 交换方法
 */
+ (void)yj_exchangeImplementationsWithClass:(Class)class
originalSelector:(SEL)originalSelector
swizzledSelector:(SEL)swizzledSelector;

/**
 给指定类添加额外的方法
 
 @param class Clss类
 @param originalSelector 被拦截方法
 @param swizzledSelector 拦截方法
 */
+ (BOOL)yj_addMethodWithClass:(Class)class
originalSelector:(SEL)originalSelector
swizzledSelector:(SEL)swizzledSelector;

/**
 拦截并且替换原来的方法
 
 @param class Clss类
 @param originalSelector 被拦截方法
 @param swizzledSelector 拦截方法
 */
+ (void)yj_replaceMethodWithClass:(Class)class
originalSelector:(SEL)originalSelector
swizzledSelector:(SEL)swizzledSelector;

/**
 获取所有已注册的类
 
 @return NSArray
 */
+ (NSArray <NSString *> *)yj_getClassList;

/**
 获取指定类的Mehtod List
 
 @param class Class
 @return NSArray
 */
+ (NSArray <NSString *> *)yj_getClassMethodListWithClass:(Class)class;

/**
 获取指定类的Property List
 
 @param class Class
 @return NSArray
 */
+ (NSArray <NSString *> *)yj_getPropertyListWithClass:(Class)class;

/**
 获取指定类的Ivar List
 
 @param class Class
 @return NSArray
 */
+ (NSArray <NSString *> *)yj_getIVarListWithClass:(Class)class;

/**
 获取指定类的Protocol List
 
 @param class Class
 @return NSArray
 */
+ (NSArray <NSString *> *)yj_getProtocolListWithClass:(Class)class;

/**
 根据Key判断是否包含该属性
 
 @param key NSString
 @return BOOL
 */
- (BOOL)yj_hasPropertyWithKey:(NSString *)key;

/**
 根据Key判断是否包含该成员变量
 
 @param key NSString
 @return BOOL
 */
- (BOOL)yj_hasIvarWithKey:(NSString *)key;

#pragma mark - GCD
/**
 异步执行Block
 
 @param complete CLObject
 */
- (void)yj_performAsyncWithComplete:(YJObject)complete;

/**
 在主线程中执行GCD, 是否需要等待
 
 @param complete CLObject
 @param wait BOOL
 */
- (void)yj_performMainThreadWithWait:(BOOL)wait
                            complete:(YJObject)complete;

/**
 指点延迟几秒后执行
 
 @param afterSecond NSTimeInterval
 @param complete CLObject
 */
- (void)yj_performWithAfterSecond:(NSTimeInterval)afterSecond
                         complete:(YJObject)complete;

#pragma mark - KVO
/**
 给对象添加KVO
 
 @param keyPath NSString, 需要监听的属性
 @param complete CLObjectKVOBlock
 */
- (void)yj_addObserverWithKeyPath:(NSString *)keyPath
                         complete:(YJObjectKVOBlock)complete;

/**
 移除对象的KVO
 
 @param keyPath NSString, 需要监听的属性
 */
- (void)yj_removeObserverWithKeyPath:(NSString *)keyPath;

/**
 移除对象所有的KVO
 */
- (void)yj_removeAllObserver;

@end

NS_ASSUME_NONNULL_END
