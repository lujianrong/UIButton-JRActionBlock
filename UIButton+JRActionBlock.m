//
//  UIButton+JRActionBlock.m
//  JROrderDishes
//
//  Created by lujianrong on 16/6/15.
//  Copyright © 2016年 JR. All rights reserved.
//

#import "UIButton+JRActionBlock.h"
#import <objc/runtime.h>

static char kActionBlockKey;

@implementation UIButton (JRActionBlock)
- (void)addTouchUpInsideBlock:(void (^)(UIButton *))actionBlock {
    objc_setAssociatedObject(self, &kActionBlockKey, [actionBlock copy], OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClickAction:(UIButton *)sender {
    void (^buttonActionBlock)() = objc_getAssociatedObject(self, &kActionBlockKey);
    if (buttonActionBlock)  buttonActionBlock(sender);
}

- (void)addActionBlock:(void (^)(UIButton *sender))actionBlock forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, &kActionBlockKey, [actionBlock copy], OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClickAction:) forControlEvents:controlEvents];
}
@end
