//
//  YHPShapeView.m
//  05-基本图形绘制
//
//  Created by yhp on 16/4/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPShapeView.h"

@implementation YHPShapeView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //  画扇形
    CGPoint center = CGPointMake(125, 125);
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    //  添加一根线到扇形
    [path addLineToPoint:center];
    //  关闭路径，默认起点画到终点
//    [path closePath];
    [path fill];// 默认关闭路径
//    [path stroke];
}

- (void)drawRadius
{
    //  圆弧
    //  center: 圆心
    //  startAngle/endAngle:是弧度
    //  clockwise --YES 顺时针
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125) radius:100 startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    [path stroke];
}

- (void)drawRoundRect
{
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:100];
    //    [path stroke];
    [path fill];// 必须是完整的封闭路径
}

@end
