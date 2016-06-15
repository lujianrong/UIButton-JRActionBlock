//
//  JRBlockButton.h
//  JROrderDishes
//
//  Created by lujianrong on 16/6/15.
//  Copyright © 2016年 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRBlockButton : UIButton
- (void)addTouchUpInsideBlock:(void (^)(UIButton *sender))actionBlock;
- (void)addActionBlock:(void (^)(UIButton *sender))actionBlock forControlEvents:(UIControlEvents)controlEvents;
@end
