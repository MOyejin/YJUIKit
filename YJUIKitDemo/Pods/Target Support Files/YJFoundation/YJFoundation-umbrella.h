#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YJFoundation.h"
#import "NSArray+YJArray.h"
#import "NSAttributedString+YJAttributedString.h"
#import "NSBundle+YJBundle.h"
#import "NSData+YJData.h"
#import "NSDate+YJDate.h"
#import "NSDictionary+YJDictionary.h"
#import "NSFileManager+YJFileManager.h"
#import "NSMutableArray+YJMutableArray.h"
#import "NSMutableAttributedString+YJMutableAttributedString.h"
#import "NSMutableDictionary+YJMutableDictionary.h"
#import "NSNotificationCenter+YJNotificationCenter.h"
#import "NSNumber+YJNumber.h"
#import "NSString+YJString.h"
#import "NSTimer+YJTimer.h"
#import "NSURL+YJURL.h"
#import "YJLanguageManager.h"
#import "YJSpeechSynthesizer.h"

FOUNDATION_EXPORT double YJFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char YJFoundationVersionString[];

