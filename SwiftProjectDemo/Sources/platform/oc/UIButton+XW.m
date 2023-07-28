//
//  UIButton+WNCategory.m
//  wannarTwo
//
//  Created by 郭令 on 16/5/5.
//  Copyright © 2016年 玩哪儿旅行. All rights reserved.
//

#import "UIButton+XW.h"
#import <objc/runtime.h>

static const void *associatedKey = "associatedKey";

@implementation UIButton (XW)

/** 为Button扩充一个点击的Block属性 */
- (void)setClick:(clickBlock)click
{
    objc_setAssociatedObject(self, associatedKey, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    if (click) {
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (clickBlock)click
{
    return objc_getAssociatedObject(self, associatedKey);
}

- (void)buttonClick:(UIButton *)sender
{
    sender.enabled = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.click) {
            self.click(sender);
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.enabled = YES;
    });
}

@end
