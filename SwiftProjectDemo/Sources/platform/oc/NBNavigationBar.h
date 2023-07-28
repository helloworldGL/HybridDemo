//
//  NBNavigationBar.h
//  NBRobot
//
//  Created by techgiant on 2017/8/2.
//  Copyright © 2017年 郭令. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBNavigationBar : UIView

+ (NBNavigationBar *)add:(UIView *)toView block:(void(^)(UIButton *leftBtn, UIButton *rightBtn, UILabel *titleLabel, UIView *bottomLineView,UIColor *color,UIView *leftLineView))block;


@end
