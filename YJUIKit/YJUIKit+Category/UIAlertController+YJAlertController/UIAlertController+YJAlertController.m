
//
//  UIAlertController+YJAlertController.m
//  YJUIKitExample
//
//  Created by Moyejin668 on 2019/1/22.
//  Copyright © 2019 Moyejin668. All rights reserved.
//

#import "UIAlertController+YJAlertController.h"

@implementation UIAlertController (YJAlertController)

- (void)yj_addCancelAlertActionWithActionTitle:(NSString *)actionTitle
                                      complete:(YJAlertControlAction)complete {
    
    UIAlertAction *yj_alertAction = [UIAlertAction actionWithTitle:actionTitle
                                                             style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               
                                                               if (complete) {
                                                                   complete(action, -1);
                                                               }
                                                           }];
    
    [self addAction:yj_alertAction];
}

- (void)yj_addAlertActionWithActionTitles:(NSArray<NSString *> *)actionTitles
                                 complete:(YJAlertControlAction)complete {

    [actionTitles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (title.length) {
            
            UIAlertAction *yj_alertAction = [UIAlertAction actionWithTitle:title
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                                       
                                                                       if (complete) {
                                                                           complete(action, idx);
                                                                       }
                                                                   }];
            
            [self addAction:yj_alertAction];
        }
    }];
}

+ (UIAlertController *)yj_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           actionTitle:(NSString *)actionTitle {
    
    return [self yj_showAlertControllerWithTitle:title
                                         message:message
                                     cancelTitle:nil
                                    actionTitles:@[actionTitle]
                                  preferredStyle:UIAlertControllerStyleAlert
                                        complete:nil];
}

+ (UIAlertController *)yj_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(YJAlertControlAction)complete {
    
    return [self yj_showAlertControllerWithTitle:title
                                         message:message
                                     cancelTitle:cancelTitle
                                    actionTitles:actionTitles
                                  preferredStyle:UIAlertControllerStyleAlert
                                        complete:complete];
}

+ (UIAlertController *)yj_showSheetControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(YJAlertControlAction)complete {
    
    return [self yj_showAlertControllerWithTitle:title
                                         message:message
                                     cancelTitle:cancelTitle
                                    actionTitles:actionTitles
                                  preferredStyle:UIAlertControllerStyleActionSheet
                                        complete:complete];
}

+ (UIAlertController *)yj_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                              complete:(YJAlertControlAction)complete {
    
    UIAlertController *yj_alertController = [self alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:preferredStyle];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *yj_alertAction = [UIAlertAction actionWithTitle:obj
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   
                                                                   if (complete) {
                                                                       
                                                                       complete(action, idx);
                                                                   }
                                                               }];
        
        [yj_alertController addAction:yj_alertAction];
    }];
    
    if (cancelTitle.length) {
    
        UIAlertAction *yj_cancelAlertAction = [UIAlertAction actionWithTitle:cancelTitle
                                                                       style:UIAlertActionStyleCancel
                                                                     handler:nil];
        
        [yj_alertController addAction:yj_cancelAlertAction];
    }
    
    return yj_alertController;
}


@end
