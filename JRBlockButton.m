//
//  JRBlockButton.m
//  JROrderDishes
//
//  Created by lujianrong on 16/6/15.
//  Copyright © 2016年 JR. All rights reserved.
//

#import "JRBlockButton.h"

@interface JRBlockButton()
@property (nonatomic,   copy) void (^actionBlock) (UIButton *sender);
@end

@implementation JRBlockButton
- (void)addTouchUpInsideBlock:(void (^)(UIButton *))block {
    self.actionBlock = [block copy];
    if ([[self actionsForTarget:self forControlEvent:UIControlEventTouchUpInside] count]> 0) {
        [self removeTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)sender {
    if (self.actionBlock)  self.actionBlock(sender);
}

- (void)addActionBlock:(void (^)(UIButton *))block forControlEvents:(UIControlEvents)controlEvents {
    self.actionBlock = [block copy];
    if ([[self actionsForTarget:self forControlEvent:controlEvents] count]>0) {
        [self removeTarget:self action:@selector(buttonAction:) forControlEvents:controlEvents];
    }
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:controlEvents];
}
@end
