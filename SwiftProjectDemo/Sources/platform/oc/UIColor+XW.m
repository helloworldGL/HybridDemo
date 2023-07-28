//
//  UIColor+XW.m
//  Check
//
//  Created by 郭令 on 2017/3/28.
//  Copyright © 2017年 Cocoa. All rights reserved.
//

#import "UIColor+XW.h"

@implementation UIColor (XW)

+ (instancetype)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}


+ (instancetype)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    // 删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // 如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    // 如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    // R
    NSString *rString = [cString substringWithRange:range];
    // G
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // B
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];
}


+ (instancetype)themeColor
{
    return [UIColor colorWithRed:255.0/255.0 green:53.0/255.0 blue:116.0/255.0 alpha:1];
}

+ (instancetype)themeColorAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:255.0/255.0 green:53.0/255.0 blue:116.0/255.0 alpha:alpha];
}

+ (instancetype)systemSeparatorColor
{
    return [UIColor colorWithRed:0.783922 green:0.780392 blue:0.8 alpha:1];
}

+ (instancetype)dashedLineColor
{
    return [UIColor colorWithHexString:@"#F2F2F2"];
}

+ (instancetype)textColor
{
    return [UIColor colorWithHexString:@"#323232"];
}
+ (instancetype)buttonColor
{
    return [UIColor colorWithHexString:@"#2F2F2F"];
}

+ (instancetype)secondTextColor
{
    return [self colorWithHexString:@"#888888"];
}

+ (instancetype)lightsGrayColor
{
    return [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f];
}

+ (instancetype)orangeYellowColor
{
    return [UIColor colorWithRed:255.0/255.0 green:121.0/255.0 blue:62.0/255.0 alpha:1.0f];
}

+ (instancetype)earthYellowColor
{
    return [UIColor colorWithRed:191.0/255.0 green:169.0/255.0 blue:148.0/255.0 alpha:1.0f];
}









#pragma mark - Plain Colors

+ (instancetype)systemRedColor;
{
    return [UIColor colorWithRed:1.0f green:0.22f blue:0.22f alpha:1.0f];
}

+ (instancetype)systemOrangeColor;
{
    return [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f];
}

+ (instancetype)systemYellowColor;
{
    return [UIColor colorWithRed:1.0f green:0.79f blue:0.28f alpha:1.0f];
}

+ (instancetype)systemGreenColor;
{
    return [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f];
}

+ (instancetype)systemLightBlueColor;
{
    return [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f];
}

+ (instancetype)systemDarkBlueColor;
{
    return [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f];
}

+ (instancetype)systemPurpleColor;
{
    return [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f];
}

+ (instancetype)systemPinkColor;
{
    return [UIColor colorWithRed:1.0f green:0.17f blue:0.34f alpha:1.0f];
}

+ (instancetype)systemDarkGrayColor;
{
    return [UIColor colorWithRed:0.56f green:0.56f blue:0.58f alpha:1.0f];
}

+ (instancetype)systemLightGrayColor;
{
    return [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
}

+ (instancetype)systemLightGrayColorWithAlpha:(CGFloat)alpha;
{
    return [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:alpha];
}




#pragma mark - Gradient Colors

+ (instancetype)systemRedGradientStartColor;
{
    return [UIColor colorWithRed:1.0f green:0.37f blue:0.23f alpha:1.0f];
}

+ (instancetype)systemRedGradientEndColor;
{
    return [UIColor colorWithRed:1.0f green:0.16f blue:0.41f alpha:1.0f];
}

+ (instancetype)systemOrangeGradientStartColor;
{
    return [UIColor colorWithRed:1.0f green:0.58f blue:0.0f alpha:1.0f];
}

+ (instancetype)systemOrangeGradientEndColor;
{
    return [UIColor colorWithRed:1.0f green:0.37f blue:0.23f alpha:1.0f];
}

+ (instancetype)systemYellowGradientStartColor;
{
    return [UIColor colorWithRed:1.0f green:0.86f blue:0.3f alpha:1.0f];
}

+ (instancetype)systemYellowGradientEndColor;
{
    return [UIColor colorWithRed:1.0f green:0.8f blue:0.01f alpha:1.0f];
}

+ (instancetype)systemGreenGradientStartColor;
{
    return [UIColor colorWithRed:0.53f green:0.99f blue:0.44f alpha:1.0f];
}

+ (instancetype)systemGreenGradientEndColor;
{
    return [UIColor colorWithRed:0.04f green:0.83f blue:0.09f alpha:1.0f];
}

+ (instancetype)systemTealGradientStartColor;
{
    return [UIColor colorWithRed:0.32f green:0.93f blue:0.78f alpha:1.0f];
}

+ (instancetype)systemTealGradientEndColor;
{
    return [UIColor colorWithRed:0.35f green:0.78f blue:0.98f alpha:1.0f];
}

+ (instancetype)systemBlueGradientStartColor;
{
    return [UIColor colorWithRed:0.10f green:0.84f blue:0.99f alpha:1.0f];
}

+ (instancetype)systemBlueGradientEndColor;
{
    return [UIColor colorWithRed:0.11f green:0.38f blue:0.94f alpha:1.0f];
}

+ (instancetype)systemVioletGradientStartColor;
{
    return [UIColor colorWithRed:0.78f green:0.27f blue:0.99f alpha:1.0f];
}

+ (instancetype)systemVioletGradientEndColor;
{
    return [UIColor colorWithRed:0.35f green:0.34f blue:0.84f alpha:1.0f];
}

+ (instancetype)systemMagentaGradientStartColor;
{
    return [UIColor colorWithRed:0.94f green:0.30f blue:0.71f alpha:1.0f];
}

+ (instancetype)systemMagentaGradientEndColor;
{
    return [UIColor colorWithRed:0.78f green:0.26f blue:0.99f alpha:1.0f];
}

+ (instancetype)systemBlackGradientStartColor;
{
    return [UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:1.0f];
}

+ (instancetype)systemBlackGradientEndColor;
{
    return [UIColor colorWithRed:0.17f green:0.17f blue:0.17f alpha:1.0f];
}

+ (instancetype)systemSilverGradientStartColor;
{
    return [UIColor colorWithRed:0.86f green:0.87f blue:0.87f alpha:1.0f];
}

+ (instancetype)systemSilverGradientEndColor;
{
    return [UIColor colorWithRed:0.54f green:0.55f blue:0.56f alpha:1.0f];
}


@end
