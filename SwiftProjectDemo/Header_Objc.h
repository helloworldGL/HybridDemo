//
//  Header_Objc.h
//  TYB
//
//  Created by qsx on 2021/11/15.
//
#define kDevice_Is_iPhoneX ({\
    BOOL isBangsScreen = NO; \
    if (@available(iOS 11.0, *)) { \
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject]; \
    isBangsScreen = window.safeAreaInsets.bottom > 0; \
    } \
    isBangsScreen; \
})

#ifndef Header_Objc_h
#define Header_Objc_h


//工具类
#import "NBNavigationBar.h"
#import <Masonry.h>

#import "UIView+Utils.h"
#import "UIColor+XW.h"
#import "UIButton+XW.h"

//图片上传




//控制器--类

#endif /* Header_Objc_h */


