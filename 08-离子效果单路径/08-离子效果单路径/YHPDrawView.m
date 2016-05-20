//
//  YHPDrawView.m
//  08-离子效果单路径
//
//  Created by yhp on 16/5/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@interface YHPDrawView ()
@property(nonatomic,strong)UIBezierPath* path;
@property(nonatomic,weak)CALayer* dotLayer;
@property(nonatomic,weak)CAReplicatorLayer* repL;
@end

@implementation YHPDrawView

static int _instancesCount = 0;

#pragma mark - 懒加载
-(UIBezierPath*)path
{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}

-(CALayer*)dotLayer
{
    if (_dotLayer == nil) {
        CGFloat wh = 10;
        CALayer* layer = [CALayer layer];
        layer.frame = CGRectMake(0, -1000, wh, wh);
        layer.backgroundColor = [UIColor blueColor].CGColor;
        layer.cornerRadius = wh / 2;
        [self.repL addSublayer:layer];
        _dotLayer = layer;
    }
    
    return _dotLayer;
}
#pragma mark - 描述路径起始点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //  获取触摸点
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    [self.path moveToPoint:curP];
}

#pragma mark - 描述路径划线
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //  获取触摸点
    UITouch* touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    [self.path addLineToPoint:curP];
    [self setNeedsDisplay];
    _instancesCount++;
}


#pragma mark - 开始动画
-(void)startAnim
{
    // 添加动画
    CAKeyframeAnimation* anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = _path.CGPath;
    anim.duration = 3;
    anim.repeatCount = MAXFLOAT;
    [self.dotLayer addAnimation:anim forKey:nil];
    _repL.instanceCount = _instancesCount;
    _repL.instanceDelay =  0.2;
}

#pragma mark - 重绘
-(void)reDraw
{
    _path = nil;
    _instancesCount = 0;
    [_dotLayer removeFromSuperlayer];
    _dotLayer = nil;
    [self setNeedsDisplay];
}

#pragma mark - 绘图

- (void)awakeFromNib
{
    CAReplicatorLayer* repL = [CAReplicatorLayer layer];
    repL.frame = self.bounds;
    [self.layer addSublayer:repL];
    _repL = repL;
}

- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}

@end
