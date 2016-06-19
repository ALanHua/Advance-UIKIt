//
//  YHPDrawView.m
//  08-路径动画
//
//  Created by yhp on 16/6/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@interface YHPDrawView ()

/** 路径 */
@property(nonatomic,strong)UIBezierPath* path;
@end

@implementation YHPDrawView

-(UIBezierPath*)path
{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    
    return _path;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    [self.path moveToPoint:curP];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //   获取触摸点
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    
    [self.path addLineToPoint:curP];
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    [self.path stroke];
}

// 开启动画
-(void)startAnim
{
    //  图层
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.path = self.path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.strokeEnd = 1;
    [self.layer addSublayer:layer];
    
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"strokeEnd";
    anim.fromValue = @0;
    anim.toValue = @1;
    anim.duration = 5;
    [layer addAnimation:anim forKey:nil];
    // 清空划线
    [self.path removeAllPoints];
    [self setNeedsDisplay];
}


@end
