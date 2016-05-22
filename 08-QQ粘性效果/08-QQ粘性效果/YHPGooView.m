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
//    self .transform = CGAffineTransformTranslate(self.transform, tranP.x, tranP.y);
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
}

#pragma mark - 甲酸两圆心之间的距离
-(CGFloat)circleCenterDistanceWithBigCircleCenter:(CGPoint)bigCircleCenter
          smallCircleCenter:(CGPoint)smallCircleCenter
{
    CGFloat offsetX = bigCircleCenter.x - smallCircleCenter.x;
    CGFloat offsetY = bigCircleCenter.y - smallCircleCenter.y;
    return sqrt(offsetX * offsetX + offsetY * offsetY);
}


@end
