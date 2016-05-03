//
//  YHPRedView.m
//  04-UIView的拖拽
//
//  Created by yhp on 16/4/21.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPRedView.h"

// UIEvent UIApplication管理的事件队列

@implementation YHPRedView


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%ld",touches.count);
//    NSLog(@"%s",__func__);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
//    获取当前点
    CGPoint curP = [touch locationInView:self];
//    获取上一点
    CGPoint preP = [touch previousLocationInView:self];
    //    获取x轴的偏移量
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
//    修改view的位置
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

// 当手指在View上移动的时候
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%s",__func__);
}
// 当手指离开View上
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%s",__func__);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
