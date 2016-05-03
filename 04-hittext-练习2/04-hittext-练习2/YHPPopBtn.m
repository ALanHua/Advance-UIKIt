//
//  YHPPopBtn.m
//  04-hittext-练习2
//
//  Created by yhp on 16/4/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPPopBtn.h"

@implementation YHPPopBtn


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
//    转换坐标系
     CGPoint chatP = [self convertPoint:point toView:self.chatView];
//    判断点是不是在chatView上
    if([self.chatView pointInside:chatP withEvent:event]){
        return self.chatView;
    }else{
        return [super hitTest:point withEvent:event];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//     UITouch
    UITouch* touch = [touches anyObject];
//    获取当前点
    CGPoint curP = [touch locationInView:self];
//    获取上一个点
    CGPoint preP = [touch previousLocationInView:self];
//    获取偏移量
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    
//    修改控件位置
    CGPoint center = self.center;
    center.x += offsetX;
    center.y += offsetY;
    self.center = center;
    
     
}

@end
