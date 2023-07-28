//
//  UIView+Utils.h
//  MVVM-demo
//
//  Created by shen_gh on 16/4/13.
//  Copyright © 2016年 申冠华. All rights reserved.
//

#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
#define horizontalrate MainScreenWidth/375
#define verticalrate  MainScreenHeight/667
#define scareNum(height) ((MainScreenHeight/667) * height)

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#define BasedColor [UIColor colorWithHexString:@"#0094BF"]
#define SecondColor [UIColor colorWithHexString:@"#2BC8D8"]
#define TextColor [UIColor colorWithHexString:@"#4B4B4B"]
#define STextColor [UIColor colorWithHexString:@"#787878"]
#define VTextColor [UIColor colorWithHexString:@"#999999"]



//#define MMWhiteColor [UIColor colorWithHexString:@"#FFFFFF"]
#define MMWhiteColor [UIColor whiteColor]
#define MMRedcolor [UIColor colorWithHexString:@"#FF3F3F"]
#define MMBluecolor [UIColor colorWithHexString:@"#1F9DE4"]


#define FontBig(number) [UIFont systemFontOfSize:number];
#define FontBold(number) [UIFont systemFontOfSize:number weight:UIFontWeightBold];;
#define FontSmallBold(number) [UIFont systemFontOfSize:number weight:UIFontWeightSemibold];
#define Image(string) [UIImage imageNamed:string]
#define Font(number) [UIFont systemFontOfSize:number]
#define String(string) [NSString stringWithFormat:@"%@",string];


#define Color(color) [UIColor color]
//#define WEAKSELF __weak typeof(&*self) weakSelf = self;.

#import <UIKit/UIKit.h>
@interface UIView (Utils)

//宽度
- (CGFloat)current_w;

//高度
- (CGFloat)current_h;

//当前view.frame的x、y、x+宽、y+高
- (CGFloat)current_x;
- (CGFloat)current_y;
- (CGFloat)current_x_w;
- (CGFloat)current_y_h;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;

@end
