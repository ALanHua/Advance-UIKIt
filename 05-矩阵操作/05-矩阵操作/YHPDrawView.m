//
//  YHPDrawView.m
//  05-矩阵操作
//
//  Created by yhp on 16/5/4.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@implementation YHPDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 
    // 1,获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2,描述路径
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    [[UIColor redColor]set];
    // 上下文的矩阵操作
    // 注意：必须要在添加路径之前
    // 平移
    CGContextTranslateCTM(ctx, 100, 50);
    // 缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    // 旋转
    CGContextRotateCTM(ctx, M_PI_2);
    // 3,把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    // 4,渲染上下文
    CGContextFillPath(ctx);
}

@end
