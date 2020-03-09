//
//  YJScanQRCodeController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJScanQRCodeController.h"
#import "UIScreen+YJScreen.h"
#import "UIImage+YJImage.h"
#import "UIViewController+YJViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface YJScanQRCodeController ()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureDevice            *captureDevice;
@property (nonatomic, strong) AVCaptureDeviceInput       *captureDeviceInput;
@property (nonatomic, strong) AVCaptureMetadataOutput    *captureMetadataOutPut;
@property (nonatomic, strong) AVCaptureSession           *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;


@end

@implementation YJScanQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if TARGET_IPHONE_SIMULATOR
    self.view.backgroundColor = [UIColor blackColor];
    
    [self yj_showAlertViewControllerWithTitle:@"模拟器没有摄像头功能"
                                      message:@"请使用真机测试"
                                  buttonTitle:@"好的"];
    
#elif TARGET_OS_IPHONE
    
    [self performSelector:@selector(yj_configCaptureVideoPreviewLayer)
               withObject:nil
               afterDelay:1.0];
    
#endif
}

- (void)yj_configCaptureVideoPreviewLayer {
    
    if (!self.yj_scanQRCodeView) {
        
        self.yj_scanQRCodeView = [[YJScanQRCodeView alloc] initWithFrame:self.view.bounds];
    }
    
    [self.view addSubview:self.yj_scanQRCodeView];
    
    [self.view.layer insertSublayer:self.captureVideoPreviewLayer
                            atIndex:0];
    
    [self yj_startCaptureSessionRunning];
}

- (AVCaptureDevice *)captureDevice {
    
    if (!_captureDevice) {
        
        _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    
    return _captureDevice;
}

- (AVCaptureDeviceInput *)captureDeviceInput {
    
    if (!_captureDeviceInput) {
        
        _captureDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.captureDevice
                                                                    error:nil];
        
    }
    
    return _captureDeviceInput;
}

- (AVCaptureMetadataOutput *)captureMetadataOutPut {
    
    if (!_captureMetadataOutPut) {
        
        _captureMetadataOutPut                = [[AVCaptureMetadataOutput alloc] init];
        _captureMetadataOutPut.rectOfInterest = CGRectMake(0,
                                                           0,
                                                           [UIScreen yj_getScreenWidth],
                                                           [UIScreen yj_getScreenHeight]);
        
        [_captureMetadataOutPut setMetadataObjectsDelegate:self
                                                     queue:dispatch_get_main_queue()];
    }
    
    return _captureMetadataOutPut;
}

- (AVCaptureSession *)captureSession {
    
    if (!_captureSession) {
        
        _captureSession = [[AVCaptureSession alloc] init];
        
        [_captureSession setSessionPreset:AVCaptureSessionPresetHigh];
        
        if ([_captureSession canAddInput:self.captureDeviceInput]) {
            [_captureSession addInput:self.captureDeviceInput];
        }
        
        if ([_captureSession canAddOutput:self.captureMetadataOutPut]) {
            [_captureSession addOutput:self.captureMetadataOutPut];
            
            self.captureMetadataOutPut.metadataObjectTypes = @[AVMetadataObjectTypeUPCECode,
                                                               AVMetadataObjectTypeCode39Code,
                                                               AVMetadataObjectTypeCode39Mod43Code,
                                                               AVMetadataObjectTypeEAN13Code,
                                                               AVMetadataObjectTypeEAN8Code,
                                                               AVMetadataObjectTypeCode93Code,
                                                               AVMetadataObjectTypeCode128Code,
                                                               AVMetadataObjectTypePDF417Code,
                                                               AVMetadataObjectTypeQRCode,
                                                               AVMetadataObjectTypeAztecCode,
                                                               AVMetadataObjectTypeInterleaved2of5Code,
                                                               AVMetadataObjectTypeITF14Code,
                                                               AVMetadataObjectTypeDataMatrixCode];
        }
    }
    
    return _captureSession;
}

- (AVCaptureVideoPreviewLayer *)captureVideoPreviewLayer {
    
    if (!_captureVideoPreviewLayer) {
        
        _captureVideoPreviewLayer              = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
        _captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _captureVideoPreviewLayer.frame        = self.view.bounds;
    }
    
    return _captureVideoPreviewLayer;
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection {
    
    if ([metadataObjects count] > 0) {
        
        if (self.yj_autoStopCaptureSessionRunning) {
            
            [self yj_stopCaptureSessionRunning];
        }
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        
        if (self.yj_scanQRCodeGetMetadataObjectsBlock) {
            self.yj_scanQRCodeGetMetadataObjectsBlock(metadataObjects);
        }
        
        if (self.yj_scanQRCodeGetMetadataStringValue) {
            self.yj_scanQRCodeGetMetadataStringValue(metadataObject.stringValue);
        }
        
        if ([self.yj_scanQRCodeControllerDelegate respondsToSelector:@selector(yj_scanQRCodeGetMetadataObjectsWithMetadataObjects:)]) {
            
            [self.yj_scanQRCodeControllerDelegate yj_scanQRCodeGetMetadataObjectsWithMetadataObjects:metadataObjects];
        }
        
        if ([self.yj_scanQRCodeControllerDelegate respondsToSelector:@selector(yj_scanQRCodeGetMetadataStringValue:)]) {
            
            [self.yj_scanQRCodeControllerDelegate yj_scanQRCodeGetMetadataStringValue:metadataObject.stringValue];
        }
    }
}

#pragma mark - Controller Capture Session
- (void)yj_startCaptureSessionRunning {
    
    [self.captureSession startRunning];
}

- (void)yj_stopCaptureSessionRunning {
    
    [self.captureSession stopRunning];
}

@end
