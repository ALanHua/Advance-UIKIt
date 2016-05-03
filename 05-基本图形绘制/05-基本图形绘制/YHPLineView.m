//
//  YHPLineView.m
//  05-基本图形绘制
//
//  Created by yhp on 16/4/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPLineView.h"

@implementation YHPLineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 在这个方法里面绘制图形
// 为什么在drawRect里面绘图，只有在这个方法里才能取到和图形View layer相关的上下文
// 当View要显示的时候调用
- (void)drawRect:(CGRect)rect
{
    // 画曲线,需要使用原生的方法
    // 1--获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2--描述路径
    CGContextMoveToPoint(ctx, 50, 50);
    // cpx -- 控制点的x cpy--- 控制点的y
    CGContextAddQuadCurveToPoint(ctx, 150, 10, 250, 50);
    // 3--渲染上下文
    CGContextStrokePath(ctx);
}


#pragma mark - 画两条线
-(void)drawUIBezierPathState
{
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(200, 200)];
    path.lineWidth = 10;
    [[UIColor redColor]set];
    [path stroke];
    //    2--线
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 0)];
    [path1 addLineToPoint:CGPointMake(30, 60)];
    path1.lineWidth = 20;
    [[UIColor greenColor]set];
    [path1 stroke];
}

-(void)drawCtxState
{
    //    1-获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    2-描述路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    //  设置起点
    CGContextMoveToPoint(ctx, 80, 60);
    //  默认下一根线的起点就是上一根线的终点
    CGContextAddLineToPoint(ctx, 100, 200);
    //    设置绘图状态
    [[UIColor redColor]setStroke];
    //    设置线宽
    CGContextSetLineWidth(ctx, 10);
    //    设置连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //    设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //    3-渲染上线文
    CGContextStrokePath(ctx);
}

#pragma mark - 划线方式3
- (void)drawLine2
{
    // UIKit绘图
    // 1-创建路径
    UIBezierPath* path = [UIBezierPath bezierPath];
    // 2-设置起点
    [path moveToPoint:CGPointMake(50, 50)];
    // 3-添加一根线到点
    [path addLineToPoint:CGPointMake(200, 200)];
    // 4-绘制路径
    [path stroke];
}
#pragma mark - 划线方式2
- (void)drawLine1
{
    // 1，获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2,描述路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 200, 200);
    // 3,渲染
    CGContextStrokePath(ctx);
}
#pragma mark - 划线方式1
- (void)drawLine
{
    // 1,获取图形上下文
    // CGContextRef:Ref引用，CG开头--》函数
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    // 2,描述路径
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  设置起点
    //  path :给那个路径设置起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    //  添加一根线到某点
    CGPathMoveToPoint(path, NULL, 200, 200);
    // 3,把路径添加到上下文
    CGContextAddPath(ctx, path);
    // 4，渲染上下文
    CGContextStrokePath(ctx);
}

@end
