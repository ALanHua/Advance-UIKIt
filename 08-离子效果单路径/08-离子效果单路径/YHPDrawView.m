//
//  YHPDrawView.m
//  08-离子效果单路径
//
//  Created by yhp on 16/5/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@interface YHPDrawView ()

/** 路径 */
@property(nonatomic,strong)UIBezierPath* path;
@property(nonatomic,weak)CALayer* dotlayer;
@property(nonatomic,weak)CAReplicatorLayer* repl;
@end

@implementation YHPDrawView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self reDraw];
    // 获取触摸点
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    // 创建路径
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:curP];
    _path = path;
    
}
static int _instancesCount = 0;
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    // 添加线
    [_path addLineToPoint:curP];
    //  重绘
    [self setNeedsDisplay];
    _instancesCount++;
}
#pragma mark - 开始动画
-(void)startAnim
{
    _dotlayer.hidden = NO;
    CAKeyframeAnimation* anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = _path.CGPath;
    anim.duration = 4;
    anim.repeatCount = MAXFLOAT;
    [_dotlayer addAnimation:anim forKey:nil];
    //  复制子层
    _repl.instanceCount = _instancesCount;
    _repl.instanceDelay = 0.1;
}

-(void)reDraw
{
    _path = nil;
    [self setNeedsDisplay];
    _dotlayer.hidden = YES;
}

#pragma mark - 画图函数
- (void)drawRect:(CGRect)rect {
  
    [_path stroke];
}

- (void)awakeFromNib
{
   // 创建复制层
    CAReplicatorLayer* repL = [CAReplicatorLayer layer];
    repL.frame = self.bounds;
    [self.layer addSublayer:repL];
   // 创建帧动画
    CGFloat wh = 10;
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, wh, wh);
    layer.cornerRadius = wh / 2;
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [repL addSublayer:layer];
    _repl = repL;
    _dotlayer = layer;
}

@end
