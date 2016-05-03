//
//  YHPProgressView.m
//  05-下载进度
//
//  Created by yhp on 16/4/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPProgressView.h"

@implementation YHPProgressView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    //  重新绘制圆弧
//    [self drawRect:self.bounds];// 不能手动调用
    [self setNeedsDisplay]; 
}


- (void)drawRect:(CGRect)rect
{
    //  创建贝瑟尔路径
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    
    [path stroke];
}

@end
