 
//  UIImage+YJImage.m
//
//  Created by  MOyejin668 on 2020/1/16.
//  Copyright © 2020年  MOyejin668. All rights reserved.
//

#import "UIImage+YJImage.h"
#import "UIScreen+YJScreen.h"

#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>
#import <AVFoundation/AVFoundation.h>

@implementation UIImage (YJImage)

#pragma mark - 生成指定颜色图片
+ (void)yj_asyncGetImageWithColor:(UIColor *)color
                       completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGRect yj_rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        
        UIGraphicsBeginImageContext(yj_rect.size);
        
        CGContextRef yj_context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(yj_context, color.CGColor);
        
        CGContextFillRect(yj_context, yj_rect);
        
        UIImage *yj_image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        NSData *yj_imageData = UIImageJPEGRepresentation(yj_image, 1.0f);
        
        yj_image = [UIImage imageWithData:yj_imageData];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(yj_image);
            }
        });
    });
}

+ (void)yj_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                       completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
        UIGraphicsBeginImageContext(rect.size);
        
        CGContextRef yj_context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(yj_context, color.CGColor);
        
        CGContextFillRect(yj_context, rect);
        
        UIImage *yj_image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        NSData *yj_imageData = UIImageJPEGRepresentation(yj_image, 1.0f);
        
        yj_image = [UIImage imageWithData:yj_imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_image);
            }
        });
    });
}

+ (void)yj_asyncGetImageWithColor:(UIColor *)color
                           radius:(CGFloat)radius
                       completion:(YJImage)completion {
    
    CGRect yj_imageSize = CGRectMake(0, 0, radius * 2, radius * 2);
    
    [self yj_asyncGetImageWithColor:color
                               rect:yj_imageSize
                             radius:radius
                         completion:completion];
}

+ (void)yj_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                           radius:(CGFloat)radius
                       completion:(YJImage)completion {
    
    [self yj_asyncGetImageWithColor:color
                               rect:rect
                         completion:^(UIImage *image) {
                             
                             [self yj_asyncCornerImageWithRadius:radius
                                                           image:image
                                                      completion:completion];
                         }];
}

#pragma mark - 截取指定视图大小的截图
+ (UIImage *)yj_getImageForView:(UIView *)view {
    
    UIImage *yj_image = nil;
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    yj_image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return yj_image;
}

#pragma mark - 缩放指定比例的图片
+ (void)yj_asyncDrawImageToSize:(CGSize)size
                          image:(UIImage *)image
                     completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        UIImage *yj_drawImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_drawImage);
            }
        });
    });
}

#pragma mark - 加载GIF图片
+ (void)yj_asynYJoadGIFImageForName:(NSString *)name
                         completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *yj_filePath = [[NSBundle mainBundle] pathForResource:name
                                                                ofType:@"gif"];
        NSData *yj_data = [NSData dataWithContentsOfFile:yj_filePath];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                if (yj_data) {
                    
                    [UIImage yj_asynYJoadGIFImageWithData:yj_data
                                               completion:^(UIImage *image) {
                                                   
                                                   completion(image);
                                               }];
                } else {
                    
                    completion([UIImage imageNamed:name]);
                }
            }
        });
    });
}

+ (void)yj_asynYJoadGIFImageWithData:(NSData *)data
                          completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if (!data) {
            return;
        }
        
        //获取数据源
        CGImageSourceRef yj_source = CGImageSourceCreateWithData((__bridge CFDataRef)data,
                                                                 NULL);
        
        // 获取图片数量(如果传入的是gif图的二进制，那么获取的是图片帧数)
        size_t yj_count = CGImageSourceGetCount(yj_source);
        
        UIImage *yj_animatedImage;
        
        if (yj_count <= 1) {
            yj_animatedImage = [[UIImage alloc] initWithData:data];
            
        } else {
            
            NSMutableArray *yj_images = [NSMutableArray array];
            
            NSTimeInterval yj_duration = 0.0f;
            
            for (size_t i = 0; i < yj_count; i++) {
                
                CGImageRef yj_image = CGImageSourceCreateImageAtIndex(yj_source,
                                                                      i,
                                                                      NULL);
                
                yj_duration += [self yj_frameDurationAtIndex:i
                                                      source:yj_source];
                
                [yj_images addObject:[UIImage imageWithCGImage:yj_image
                                                         scale:[UIScreen mainScreen].scale
                                                   orientation:UIImageOrientationUp]];
                
                CGImageRelease(yj_image);
            }
            
            // 如果上面的计算播放时间方法没有成功，就按照下面方法计算
            // 计算一次播放的总时间：每张图播放1/10秒 * 图片总数
            if (!yj_duration) {
                yj_duration = (1.0f / 10.0f) * yj_count;
            }
            
            yj_animatedImage = [UIImage animatedImageWithImages:yj_images
                                                       duration:yj_duration];
        }
        
        CFRelease(yj_source);

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_animatedImage);
            }
        });
    });
}

// 私有方法
+ (CGFloat)yj_frameDurationAtIndex:(NSUInteger)index
                            source:(CGImageSourceRef)source {
    
    CGFloat yj_frameDuration = 0.1f;
    
    // 获取这一帧的属性字典
    CFDictionaryRef yj_cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source,
                                                                              index,
                                                                              nil);
    
    NSDictionary *yj_frameProperties = (__bridge NSDictionary *)yj_cfFrameProperties;
    NSDictionary *yj_gifProperties = yj_frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    // 从字典中获取这一帧持续的时间
    NSNumber *yj_delayTimeUnYJampedProp = yj_gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    
    if (yj_delayTimeUnYJampedProp) {
        
        yj_frameDuration = [yj_delayTimeUnYJampedProp floatValue];
        
    } else {
        
        NSNumber *yj_delayTimeProp = yj_gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        
        if (yj_delayTimeProp) {
            
            yj_frameDuration = [yj_delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (yj_frameDuration < 0.011f) {
        
        yj_frameDuration = 0.100f;
    }
    
    CFRelease(yj_cfFrameProperties);
    
    return yj_frameDuration;
}

+ (BOOL)yj_isAnimatedGIFWithData:(NSData *)data {
    
    if (data.length < 16) {
        return NO;
    }
    
    UInt32 yj_magic = *(UInt32 *)data.bytes;
    
    if ((yj_magic & 0xFFFFFF) != '\0FIG') {
        return NO;
    }
    
    CGImageSourceRef yj_imageSourceRef = CGImageSourceCreateWithData((__bridge CFTypeRef)data, NULL);
    
    if (!yj_imageSourceRef) {
        return NO;
    }
    
    size_t yj_sizeT = CGImageSourceGetCount(yj_imageSourceRef);
    
    CFRelease(yj_imageSourceRef);
    
    return yj_sizeT > 1;
}

+ (BOOL)yj_isAnimatedGIFWithFilePath:(NSString *)filePath {
    
    if (filePath.length == 0) {
        return NO;
    }
    
    const char *yj_charPath = filePath.UTF8String;
    
    FILE *yj_file = fopen(yj_charPath, "rb");
    
    if (!yj_file) {
        return NO;
    }
    
    BOOL yj_isGIF = NO;
    
    UInt32 yj_magic = 0;
    
    if (fread(&yj_magic, sizeof(UInt32), 1, yj_file) == 1) {
        
        if ((yj_magic & 0xFFFFFF) == '\0FIG') {
            
            yj_isGIF = YES;
        }
    }
    
    fclose(yj_file);
    
    return yj_isGIF;
}

#pragma mark - 异步生成一个二维码
+ (void)yj_asyncCreateQRCodeImageWithString:(NSString *)string
                                 completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        CIFilter *yj_QRCodeImageFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        
        [yj_QRCodeImageFilter setDefaults];
        
        NSData *QRCodeImageData = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        [yj_QRCodeImageFilter setValue:QRCodeImageData
                                forKey:@"inputMessage"];
        [yj_QRCodeImageFilter setValue:@"H"
                                forKey:@"inputCorrectionLevel"];
        
        CIImage *yj_QRCodeCIImage = [yj_QRCodeImageFilter outputImage];
        
        yj_QRCodeCIImage = [yj_QRCodeCIImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
        
        UIImage *yj_QRCodeUIImage = [UIImage imageWithCIImage:yj_QRCodeCIImage];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(yj_QRCodeUIImage);
            }
        });
    });
}

+ (void)yj_asyncCreateQRCodeImageWithString:(NSString *)string
                                  logoImage:(UIImage *)logoImage
                                 completion:(YJImage)completion {
        
    [self yj_asyncCreateQRCodeImageWithString:string
                                   completion:^(UIImage *image) {
                                       
                                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                           
                                           UIGraphicsBeginImageContext(image.size);
                                           
                                           [image drawInRect:CGRectMake(0,
                                                                        0,
                                                                        image.size.width,
                                                                        image.size.height)];
                                           
                                           CGFloat yj_imageW = 150;
                                           CGFloat yj_imageH = yj_imageW;
                                           CGFloat yj_imageX = (image.size.width - yj_imageW) * 0.5;
                                           CGFloat yj_imgaeY = (image.size.height - yj_imageH) * 0.5;
                                           
                                           [logoImage drawInRect:CGRectMake(yj_imageX, yj_imgaeY, yj_imageW, yj_imageH)];
                                           
                                           UIImage *yj_finalyImage = UIGraphicsGetImageFromCurrentImageContext();
                                           
                                           UIGraphicsEndImageContext();
                                           
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               
                                               if (completion) {
                                                   
                                                   completion(yj_finalyImage);
                                               }
                                           });
                                       });
                                   }];
}

#pragma mark - 生成条形码
+ (void)yj_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     completion:(YJImage)completion {
    
    [self yj_asyncCreate128BarcodeImageWithString:string
                                       imageSpace:[UIScreen yj_fitScreen:14]
                                       completion:completion];
}

+ (void)yj_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     imageSpace:(CGFloat)imageSpace
                                     completion:(YJImage)completion {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CIFilter *yj_code128Filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
        
        NSData *yj_contentData = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        [yj_code128Filter setValue:yj_contentData
                            forKey:@"inputMessage"];
        [yj_code128Filter setValue:@(imageSpace)
                            forKey:@"inputQuietSpace"];
        
        CIImage *yj_code128Image = yj_code128Filter.outputImage;
        
        yj_code128Image = [yj_code128Image imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
        
        UIImage *yj_code128UIImage = [UIImage imageWithCIImage:yj_code128Image];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_code128UIImage);
            }
        });
    });
}

#pragma mark - 获取指定Bundle文件里的图片
+ (UIImage *)yj_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName {
    
    NSBundle *yj_mainBundle = [NSBundle bundleForClass:NSClassFromString(bundle)];
    
    NSString *yj_pathString = [yj_mainBundle pathForResource:bundle
                                                      ofType:@"bundle"];
    
    NSBundle *yj_resourcesBundle = [NSBundle bundleWithPath:yj_pathString];
    
    if (!yj_resourcesBundle) {
        
        yj_resourcesBundle = yj_mainBundle;
    }
    
    UIImage *yj_image = [UIImage imageNamed:imageName
                                   inBundle:yj_resourcesBundle
              compatibleWithTraitCollection:nil];
    
    return yj_image;
}

+ (void)yj_asyncGetVideoPreViewImageWithVideoURL:(NSURL *)videoURL
                                      completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        AVURLAsset *yj_avURLAsset = [[AVURLAsset alloc] initWithURL:videoURL
                                                            options:nil];
        
        AVAssetImageGenerator *yj_avAssetImageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:yj_avURLAsset];
        
        yj_avAssetImageGenerator.appliesPreferredTrackTransform = YES;
        
        CMTime yj_time    = CMTimeMakeWithSeconds(0.0, 600);
        NSError *yj_error = nil;
        
        CMTime yj_actualTime;
        CGImageRef yj_videoImageRef = [yj_avAssetImageGenerator copyCGImageAtTime:yj_time
                                                                       actualTime:&yj_actualTime
                                                                            error:&yj_error];
        
        UIImage *yj_image = [[UIImage alloc] initWithCGImage:yj_videoImageRef];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_image);
            }
        });
    });
}

#pragma mark - 图片高斯模糊处理
+ (void)yj_asyncBlurImageWithBlur:(CGFloat)blur
                            image:(UIImage *)image
                       completion:(YJImage)completion {
    
    __block CGFloat yj_blurValue = blur;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *yj_imageData  = UIImageJPEGRepresentation(image, 1); // convert to jpeg
        UIImage *yj_destImage = [UIImage imageWithData:yj_imageData];
        
        if (yj_blurValue < 0.f || yj_blurValue > 1.f) {
            yj_blurValue = 0.5f;
        }
        
        int yj_boxSize = (int)(blur * 40);
        
        yj_boxSize = yj_boxSize - (yj_boxSize % 2) + 1;
        
        CGImageRef yj_imageRef = yj_destImage.CGImage;
        
        vImage_Buffer yj_inBuffer, yj_outBuffer;
        
        vImage_Error yj_error;
        
        void *yj_pixelBuffer;
        
        //create vImage_Buffer with data from CGImageRef
        
        CGDataProviderRef yj_inProvider = CGImageGetDataProvider(yj_imageRef);
        CFDataRef yj_inBitmapData = CGDataProviderCopyData(yj_inProvider);
        
        yj_inBuffer.width    = CGImageGetWidth(yj_imageRef);
        yj_inBuffer.height   = CGImageGetHeight(yj_imageRef);
        yj_inBuffer.rowBytes = CGImageGetBytesPerRow(yj_imageRef);
        yj_inBuffer.data     = (void *)CFDataGetBytePtr(yj_inBitmapData);
        
        //create vImage_Buffer for output
        
        yj_pixelBuffer = malloc(CGImageGetBytesPerRow(yj_imageRef) * CGImageGetHeight(yj_imageRef));
        
        if(yj_pixelBuffer == NULL) {
            
            NSLog(@"No pixelbuffer");
        }
        
        yj_outBuffer.data     = yj_pixelBuffer;
        yj_outBuffer.width    = CGImageGetWidth(yj_imageRef);
        yj_outBuffer.height   = CGImageGetHeight(yj_imageRef);
        yj_outBuffer.rowBytes = CGImageGetBytesPerRow(yj_imageRef);
        
        // Create a third buffer for intermediate processing
        void *yj_pixelBuffer2 = malloc(CGImageGetBytesPerRow(yj_imageRef) * CGImageGetHeight(yj_imageRef));
        
        vImage_Buffer yj_outBuffer2;
        
        yj_outBuffer2.data     = yj_pixelBuffer2;
        yj_outBuffer2.width    = CGImageGetWidth(yj_imageRef);
        yj_outBuffer2.height   = CGImageGetHeight(yj_imageRef);
        yj_outBuffer2.rowBytes = CGImageGetBytesPerRow(yj_imageRef);
        
        //perform convolution
        yj_error = vImageBoxConvolve_ARGB8888(&yj_inBuffer,
                                              &yj_outBuffer2,
                                              NULL,
                                              0,
                                              0,
                                              yj_boxSize,
                                              yj_boxSize,
                                              NULL,
                                              kvImageEdgeExtend);
        
        if (yj_error) {
            NSLog(@"error from convolution %ld", yj_error);
        }
        
        yj_error = vImageBoxConvolve_ARGB8888(&yj_outBuffer2,
                                              &yj_inBuffer,
                                              NULL,
                                              0,
                                              0,
                                              yj_boxSize,
                                              yj_boxSize,
                                              NULL,
                                              kvImageEdgeExtend);
        
        if (yj_error) {
            NSLog(@"error from convolution %ld", yj_error);
        }
        
        yj_error = vImageBoxConvolve_ARGB8888(&yj_inBuffer,
                                              &yj_outBuffer,
                                              NULL,
                                              0,
                                              0,
                                              yj_boxSize,
                                              yj_boxSize,
                                              NULL,
                                              kvImageEdgeExtend);
        
        if (yj_error) {
            NSLog(@"error from convolution %ld", yj_error);
        }
        
        CGColorSpaceRef yj_colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        
        CGContextRef yj_ontextRef = CGBitmapContextCreate(yj_outBuffer.data,
                                                          yj_outBuffer.width,
                                                          yj_outBuffer.height,
                                                          8,
                                                          yj_outBuffer.rowBytes,
                                                          yj_colorSpaceRef,
                                                          (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
        
        CGImageRef yj_imageRef2 = CGBitmapContextCreateImage(yj_ontextRef);
        UIImage *yj_image = [UIImage imageWithCGImage:yj_imageRef2];
        
        //YJean up
        CGContextRelease(yj_ontextRef);
        CGColorSpaceRelease(yj_colorSpaceRef);
        
        free(yj_pixelBuffer);
        free(yj_pixelBuffer2);
        CFRelease(yj_inBitmapData);
        
        CGImageRelease(yj_imageRef2);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_image);
            }
        });
    });
}

#pragma mark - 图片圆角处理
+ (void)yj_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                           completion:(YJImage)completion {
    
    [UIImage yj_asyncCornerImageWithRadius:radius
                                     image:image
                               borderWidth:0
                               borderColor:nil
                                completion:completion];
}

+ (void)yj_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                           completion:(YJImage)completion {
    
    [UIImage yj_asyncCornerImageWithRadius:radius
                                     image:image
                                   corners:UIRectCornerAllCorners
                               borderWidth:borderWidth
                               borderColor:borderColor
                            borderLineJoin:kCGLineJoinMiter
                                completion:completion];
}

+ (void)yj_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin
                           completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        
        CGContextScaleCTM(context, 1, -1);
        
        CGContextTranslateCTM(context, 0, -rect.size.height);
        
        CGFloat minSize = MIN(image.size.width, image.size.height);
        
        if (borderWidth < minSize / 2) {
            
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, borderWidth, borderWidth)
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, borderWidth)];
            [path closePath];
            
            CGContextSaveGState(context);
            
            [path addClip];
            
            CGContextDrawImage(context, rect, image.CGImage);
            CGContextRestoreGState(context);
        }
        
        if (borderColor && borderWidth < minSize / 2 && borderWidth > 0) {
            
            CGFloat strokeInset = (floor(borderWidth * image.scale) + 0.5) / image.scale;
            
            CGRect strokeRect = CGRectInset(rect, strokeInset, strokeInset);
            
            CGFloat strokeRadius = radius > image.scale / 2 ? radius - image.scale / 2 : 0;
            
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeRect
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(strokeRadius, borderWidth)];
            [path closePath];
            
            path.lineWidth = borderWidth;
            path.lineJoinStyle = borderLineJoin;
            
            [borderColor setStroke];
            
            [path stroke];
        }
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(image);
            }
        });
    });
}

#pragma mark - 图片处理
+ (void)yj_resetSizeWithImage:(UIImage *)image
                         size:(CGSize)size
                   completion:(YJImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        UIImage *yj_resetSizeImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(yj_resetSizeImage);
            }
        });
    });
}

+ (CGSize)yj_getScaleImageWithImage:(UIImage *)image
                             length:(CGFloat)length {
    
    CGFloat yj_resetW = 0.0f;
    CGFloat yj_resetH = 0.0f;
    
    CGFloat yj_imageW = image.size.width;
    CGFloat yj_imageH = image.size.height;
    
    if (yj_imageW > length || yj_imageH > length) {
        
        if (yj_imageW > yj_imageH) {
            
            yj_resetW = length;
            yj_resetH = yj_resetW * yj_imageH / yj_imageW;
            
        } else if (yj_imageH > yj_imageW) {
            
            yj_resetH = length;
            yj_resetW = yj_resetH * yj_imageW / yj_imageH;
        } else {
            
            yj_resetW = length;
            yj_resetH = length;
        }
    } else {
        
        return CGSizeMake(yj_imageW, yj_imageH);
    }
    
    return CGSizeMake(yj_resetW, yj_resetH);
}

@end
