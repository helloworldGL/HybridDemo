//
//  NBNavigationBar.m
//  NBRobot
//
//  Created by techgiant on 2017/8/2.
//  Copyright © 2017年 郭令. All rights reserved.
//



#import "NBNavigationBar.h"
#import "Header_Objc.h"

@interface NBNavigationBar ()


@end


@implementation NBNavigationBar

+ (NBNavigationBar *)add:(UIView *)toView block:(void(^)(UIButton *leftBtn, UIButton *rightBtn, UILabel *titleLabel, UIView *bottomLineView,UIColor *color,UIView *leftLineView))block
{
    NBNavigationBar *bar = [[NBNavigationBar alloc] init];
    [toView addSubview:bar];
    bar.backgroundColor = [UIColor whiteColor];
    [bar mas_makeConstraints:^(MASConstraintMaker *make) {
        if (kDevice_Is_iPhoneX) {
            make.left.right.offset(0.0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(88);
        }else{
            make.left.top.right.offset(0.0);
            make.height.mas_equalTo(64);
        }
    }];
    if (block) {
        block(bar.leftBtn, bar.rightBtn, bar.titleLabel, bar.bottomLineView,bar.color,bar.leftLineView);
    }
    return bar;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    self.backgroundColor = self.color;
    //NSLog(@"%@",self.color);
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = Font(17);
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = MMBluecolor;
    [self addSubview:titleLabel];
    [self bringSubviewToFront:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        if (kDevice_Is_iPhoneX) {
            make.top.offset(44.0);
        }else{
            make.top.offset(20.0);
        }
        make.bottom.offset(0.0);
        make.centerX.equalTo(self);
    }];
    self.titleLabel = titleLabel;
    
    // 左侧按钮
    UIButton *leftBtn = [[UIButton alloc] init];
    [self addSubview:leftBtn];
    
    leftBtn.titleLabel.font = Font(16);
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(10.0);
        make.left.offset(15);
        make.width.mas_greaterThanOrEqualTo(70);
//        make.width.mas_equalTo(70.0);
        make.centerY.equalTo(titleLabel);
    }];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.leftBtn = leftBtn;
    
    
    // 左侧按钮分割线
    UIView *leftLineView = [[UIView alloc] init];
    leftLineView.backgroundColor = [UIColor systemSeparatorColor];
    [self addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(leftBtn);
        make.left.equalTo(leftBtn.mas_right).offset(0.0);
        make.height.mas_equalTo(25.0);
        make.width.mas_equalTo(0.5);
    }];
    self.leftLineView = leftLineView;
    leftLineView.backgroundColor = [UIColor clearColor];
    
    // 右侧按钮
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.titleLabel.font = Font(16);
    [rightBtn setTitleColor:MMWhiteColor forState:UIControlStateNormal];
    [self addSubview:rightBtn];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15.0);
        make.centerY.equalTo(titleLabel);
        make.width.mas_equalTo(100.0);
    }];
    self.rightBtn = rightBtn;
    
    // 底部分割线
    UIView *bottomLineView = [[UIView alloc] init];
    bottomLineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0.0);
        make.height.mas_equalTo(0.5);
    }];
    self.bottomLineView = bottomLineView;
}

@end
