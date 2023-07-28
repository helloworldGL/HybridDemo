//
//  UIColor+XW.h
//  Check
//
//  Created by 郭令 on 2017/3/28.
//  Copyright © 2017年 Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XW)

/**
 *  从十六进制字符串获取颜色
 *
 *  @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @return UIColor
 */
+ (instancetype)colorWithHexString:(NSString *)color;


/**
 *  16进制的颜色输入法，可以输入透明度
 *
 *  @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (instancetype)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 *  主题色
 *
 *  @return UIColor
 */
+ (instancetype)themeColor;
+ (instancetype)themeColorAlpha:(CGFloat)alpha;


/**
 *  正常文字颜色
 *
 *  @return UIColor
 */
+ (instancetype)textColor;


/**
 *  #2F2F2F
 *
 *  @return UIColor
 */
+ (instancetype)buttonColor;


/**
 *  二级文本颜色
 *
 *  @return UIColor
 */
+ (instancetype)secondTextColor;

/**
 *  系统cell分割线颜色
 *
 *  @return UIColor
 */
+ (instancetype)systemSeparatorColor;

/**
 *  虚线颜色
 *
 *  @return UIColor
 */
+ (instancetype)dashedLineColor;

/**
 *  浅灰色
 *
 *  @return UIColor
 */
+ (instancetype)lightsGrayColor;

/**
 *  橘黄色
 *
 *  @return UIColor
 */
+ (instancetype)orangeYellowColor;

/**
 *  土黄色
 *
 *  @return UIColor
 */
+ (instancetype)earthYellowColor;



// Plain Colors
+ (instancetype)systemRedColor;
+ (instancetype)systemOrangeColor;
+ (instancetype)systemYellowColor;
+ (instancetype)systemGreenColor;
+ (instancetype)systemLightBlueColor;
+ (instancetype)systemDarkBlueColor;
+ (instancetype)systemPurpleColor;
+ (instancetype)systemPinkColor;
+ (instancetype)systemDarkGrayColor;
+ (instancetype)systemLightGrayColor;
+ (instancetype)systemLightGrayColorWithAlpha:(CGFloat)alpha;

// Gradient Colors
+ (instancetype)systemRedGradientStartColor;
+ (instancetype)systemRedGradientEndColor;

+ (instancetype)systemOrangeGradientStartColor;
+ (instancetype)systemOrangeGradientEndColor;

+ (instancetype)systemYellowGradientStartColor;
+ (instancetype)systemYellowGradientEndColor;

+ (instancetype)systemGreenGradientStartColor;
+ (instancetype)systemGreenGradientEndColor;

+ (instancetype)systemTealGradientStartColor;
+ (instancetype)systemTealGradientEndColor;

+ (instancetype)systemBlueGradientStartColor;
+ (instancetype)systemBlueGradientEndColor;

+ (instancetype)systemVioletGradientStartColor;
+ (instancetype)systemVioletGradientEndColor;

+ (instancetype)systemMagentaGradientStartColor;
+ (instancetype)systemMagentaGradientEndColor;

+ (instancetype)systemBlackGradientStartColor;
+ (instancetype)systemBlackGradientEndColor;

+ (instancetype)systemSilverGradientStartColor;
+ (instancetype)systemSilverGradientEndColor;

@end
