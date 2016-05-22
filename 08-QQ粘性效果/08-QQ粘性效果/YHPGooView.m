//
//  YHPGooView.m
//  08-QQ粘性效果
//
//  Created by yhp on 16/5/21.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPGooView.h"

@interface YHPGooView ()
@property(nonatomic,weak)UIView* smallCircleView;
@property(nonatomic,assign)CGFloat oriSmallRadius;
@property(nonatomic,weak)CAShapeLayer* shapeLayer;
@end

@implementation YHPGooView

#pragma mark - 懒加载
- (UIView*)smallCircleView
{
    if (_smallCircleView == nil) {
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = self.backgroundColor;
        _smallCircleView = view;
        // 添加到小圆的父控件上
        [self.superview insertSubview:view belowSubview:self];
    }
    
    return _smallCircleView;
}

- (CAShapeLayer*)shapeLayer
{
    if (_shapeLayer == nil) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        _shapeLayer = layer;
        layer.fillColor = self.backgroundColor.CGColor;
        
        [self.superview.layer insertSublayer:layer below:self.layer];
    }
    return _shapeLayer;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    
    [self setUp];
}

#pragma mark - 初始化方法
-(void)setUp
{
    CGFloat w = self.bounds.size.width;
    _oriSmallRadius = w / 2;
    
    self.layer.cornerRadius = w / 2;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    // 添加拖动手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    //  设置小圆的位置和尺寸
    self.smallCircleView.center = self.center;
    self.smallCircleView.bounds = self.bounds;
    self.smallCircleView.layer.cornerRadius = w / 2;


}


#pragma mark - 添加拖动手势处理函数
// 为什么UIButton 不用TouchBegin,因为会跟按钮的监听事件产生冲突
-(void)pan:(UIPanGestureRecognizer*)pan
{
    //  获取手指的偏移量
    CGPoint tranP = [pan translationInView:self];
    //  修改按钮的形变,不会修改中心点
    CGPoint center = self.center;
    center.x += tranP.x;
    center.y += tranP.y;
    self.center = center;
    //  复位
    [pan setTranslation:CGPointZero inView:self];
    //  后面圆是随着半径，是随着两个圆心的距离不断增加而减小
    // 计算圆心
    CGFloat d = [self circleCenterDistanceWithBigCircleCenter:self.center smallCircleCenter:self.smallCircleView.center];
    NSLog(@"%f",d);
    // 计算小圆的半径
    CGFloat smallRadius = _oriSmallRadius - d / 10;

    //  设置小圆尺寸
    self.smallCircleView.bounds = CGRectMake(0, 0, smallRadius * 2, smallRadius * 2);
    self.smallCircleView.layer.cornerRadius = smallRadius;
    //  绘制不规则矩形，不能通过绘图，应为绘图只会在当前控件上
    if (d) {
        self.shapeLayer.path = [self pathWithBigCircleView:self smallCircleView:self.smallCircleView].CGPath;
    }

}

#pragma mark - 甲酸两圆心之间的距离
-(CGFloat)circleCenterDistanceWithBigCircleCenter:(CGPoint)bigCircleCenter
          smallCircleCenter:(CGPoint)smallCircleCenter
{
    CGFloat offsetX = bigCircleCenter.x - smallCircleCenter.x;
    CGFloat offsetY = bigCircleCenter.y - smallCircleCenter.y;
    return sqrt(offsetX * offsetX + offsetY * offsetY);
}
#pragma mark - 通过两个圆之间的一条矩形路径
-(UIBezierPath*)pathWithBigCircleView:(UIView*)bigCircleView
                smallCircleView:(UIView*)smallCircleView
{
    CGPoint bigCenter = bigCircleView.center;
    CGFloat x2 = bigCenter.x;
    CGFloat y2 = bigCenter.y;
    CGFloat r2 = bigCircleView.bounds.size.width / 2;
    
    CGPoint smallCenter = smallCircleView.center;
    CGFloat x1 = smallCenter.x;
    CGFloat y1 = smallCenter.y;
    CGFloat r1 = smallCircleView.bounds.size.width / 2;
    // 获取圆心距离
    CGFloat d = [self circleCenterDistanceWithBigCircleCenter:bigCenter smallCircleCenter:smallCenter];
    CGFloat sinθ = (x2 - x1) / d;
    CGFloat cosθ = (y2 - y1) / d;
    // 坐标系基于父控件
    CGPoint pointA = CGPointMake(x1 - r1 * cosθ , y1 + r1 * sinθ);
    CGPoint pointB = CGPointMake(x1 + r1 * cosθ , y1 - r1 * sinθ);
    CGPoint pointC = CGPointMake(x2 + r2 * cosθ , y2 - r2 * sinθ);
    CGPoint pointD = CGPointMake(x2 - r2 * cosθ , y2 + r2 * sinθ);
    CGPoint pointO = CGPointMake(pointA.x + d / 2 * sinθ , pointA.y + d / 2 * cosθ);
    CGPoint pointP =  CGPointMake(pointB.x + d / 2 * sinθ , pointB.y + d / 2 * cosθ);
    UIBezierPath *path = [UIBezierPath bezierPath];
    // A
    [path moveToPoint:pointA];
    // AB
    [path addLineToPoint:pointB];
    // 绘制BC曲线
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    // CD
    [path addLineToPoint:pointD];
    // 绘制DA曲线
    [path addQuadCurveToPoint:pointA controlPoint:pointO];
    return path;
    
}


@end
