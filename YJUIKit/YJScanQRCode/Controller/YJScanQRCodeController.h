//
//  YJScanQRCodeController.h
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJViewController.h"
#import "YJScanQRCodeView.h"


NS_ASSUME_NONNULL_BEGIN

@protocol YJScanQRCodeControllerDelegate <NSObject>

@optional

/**
 获取扫描后的元数据
 
 @param metadataObjects NSArray
 */
- (void)yj_scanQRCodeGetMetadataObjectsWithMetadataObjects:(NSArray *)metadataObjects;

/**
 获取扫描后的String Value数据
 
 @param stringValue NSString
 */
- (void)yj_scanQRCodeGetMetadataStringValue:(NSString *)stringValue;

@end

@interface YJScanQRCodeController : YJViewController

/**
 扫描所覆盖的Mark视图, 可定义更换
 */
@property (nonatomic, strong) UIView *yj_scanQRCodeView;

/**
 是否自动停止扫描
 */
@property (nonatomic, assign) BOOL yj_autoStopCaptureSessionRunning;

/**
 YJScanQRCodeControllerDelegate
 */
@property (nonatomic, weak) id <YJScanQRCodeControllerDelegate> yj_scanQRCodeControllerDelegate;


#pragma mark - Block

/**
 获取扫描后的元数据Block
 */
@property (nonatomic, copy) void(^yj_scanQRCodeGetMetadataObjectsBlock)(NSArray *metadataObjects);

/**
 获取扫描后的String Value数据
 */
@property (nonatomic, copy) void(^yj_scanQRCodeGetMetadataStringValue)(NSString *stringValue);

/**
 开始扫描, 默认自动实现
 */
- (void)yj_startCaptureSessionRunning;

/**
 停止扫描, 如果yj_autoStopCaptureSessionRunning为YES则不需要手动, 否则就要手动停止
 */
- (void)yj_stopCaptureSessionRunning;


@end

NS_ASSUME_NONNULL_END
