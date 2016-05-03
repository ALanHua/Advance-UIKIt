//
//  YHPBaseView.m
//  04-事件的产生和传递
//
//  Created by yhp on 16/4/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPBaseView.h"

@implementation YHPBaseView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",[self class]);
}

// 所有的视图都是基础baseView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
//    NSLog(@"%@-----",[self class]);
//    return [super hitTest:point withEvent:event];
//    1,判断当前控件是否接收事件
//    NSLog(@"%d,%d,%f",self.userInteractionEnabled, self.hidden,self.alpha);
    if (self.userInteractionEnabled == NO ||
        self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }
//    2,判断点在不在当前控件
    if ([self pointInside:point withEvent:event] == NO ) {
        return nil;
    }
//    3,从后往前遍历自己的子控件
    NSInteger count = self.subviews.count;
    
    for (NSInteger i = count - 1; i >= 0; i--) {
        UIView* childView = self.subviews[i];
        //  坐标系转换
        CGPoint childPoint = [self convertPoint:point toView:childView];
        UIView* fitView = [childView hitTest:childPoint withEvent:event];
    
        if (fitView) {// 找到最合适的view
            return fitView;
        }
    }
//    循环结束,没有比自己更合适的bew了
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
