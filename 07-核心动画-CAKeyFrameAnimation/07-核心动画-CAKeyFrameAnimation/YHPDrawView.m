//
//  YHPDrawView.m
//  07-核心动画-CAKeyFrameAnimation
//
//  Created by yhp on 16/5/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@interface YHPDrawView ()

/** 路径 */
@property(nonatomic,strong)UIBezierPath* path;

@end

@implementation YHPDrawView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    //  获取手指触摸点
    CGPoint curP = [touch locationInView:self];
    //  创建路径
    UIBezierPath* path = [UIBezierPath bezierPath];
    _path = path;
    //  设置起点
    [path moveToPoint:curP];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    
    [_path addLineToPoint:curP];
    
    [self setNeedsDisplay];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //  给imageView添加核心动画
    //  核心动画
    CAKeyframeAnimation* anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.path = _path.CGPath;
    anim.duration = 1;
    //    anim.values = @[@(angle2radian(-5)),@(angle2radian(5)),@(angle2radian(-5))];
    anim.repeatCount = MAXFLOAT;
    
    [[[self.subviews firstObject] layer] addAnimation:anim forKey:nil];
}

- (void)drawRect:(CGRect)rect
{
    [_path stroke];
}

@end
