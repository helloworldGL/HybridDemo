//
//  NBNavigationBar.h
//  NBRobot
//
//  Created by techgiant on 2017/8/2.
//  Copyright © 2017年 郭令. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBNavigationBar : UIView

@property (nonatomic, weak) UIButton *leftBtn;
@property (nonatomic, weak) UIButton *rightBtn;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIView *bottomLineView;
@property (nonatomic, weak) UIView *leftLineView;
@property (retain, nonatomic) UIColor *color;


+ (NBNavigationBar *)add:(UIView *)toView block:(void(^)(UIButton *leftBtn, UIButton *rightBtn, UILabel *titleLabel, UIView *bottomLineView,UIColor *color,UIView *leftLineView))block;


@end
