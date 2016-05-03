    //
//  YHPDrawView.m
//  05- 图形上下文状态栈
//
//  Created by yhp on 16/5/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@implementation YHPDrawView
// 用贝瑟尔绘制图形【path stroke]，上下文状态有贝瑟尔决定
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //     获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //     第一根
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 125)];
    [path addLineToPoint:CGPointMake(240, 125)];
//    path.lineWidth = 10;
//    path.lineCapStyle = kCGLineCapRound;
    //   把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //    保存上下文状态
    CGContextSaveGState(ctx);
    
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor]set];
    //    [path stroke];
    //    渲染上下文
    CGContextStrokePath(ctx);
    
    //     第二根
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(125, 10)];
    [path addLineToPoint:CGPointMake(125, 240)];
    CGContextAddPath(ctx, path.CGPath);
    //   还原上下文
    CGContextRestoreGState(ctx);

    CGContextStrokePath(ctx);
}

@end
