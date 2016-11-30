//
//  ViewController.m
//  12-UIDynamic
//
//  Created by yhp on 2016/11/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
/** 物理仿真器 */
@property(nonatomic,strong) UIDynamicAnimator* animator;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ViewController

-(UIDynamicAnimator*)animator
{
    if (!_animator) {
        // 1,initWithReferenceView 参照视图<----->仿真范围
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueView.transform = CGAffineTransformMakeRotation(M_PI_4);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    // 创建吸附行为
    UISnapBehavior* snap = [[UISnapBehavior alloc]initWithItem:self.blueView snapToPoint:point];
    // 防抖系数
    snap.damping = 1.0;
    // 添加行为
    [self.animator removeAllBehaviors];
    [self.animator addBehavior:snap];
    
}

/**
 重力加碰撞
 */
-(void)textCollision2
{
    // 1,创建碰撞行为
    UICollisionBehavior* collision = [[UICollisionBehavior alloc]init];
    [collision addItem:self.blueView];
    //    [collision addItem:self.segmentedControl];
    // 添加边界
    //    CGFloat startY = self.view.frame.size.height * 0.5;
    //    CGFloat endX   = self.view.frame.size.width * 0.5;
    //    CGFloat endY   = self.view.frame.size.height;
    //
    //    [collision addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(0, startY) toPoint:CGPointMake(endX, endY)];
    //    [collision addBoundaryWithIdentifier:@"line2" fromPoint:CGPointMake(endX, 0) toPoint:CGPointMake(endX, endY)];
    CGFloat width  = self.view.frame.size.width;
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, width, width)];
    
    [collision addBoundaryWithIdentifier:@"circle" forPath:path];
    // 2，创建仿真行为
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc]init];
    [gravity addItem:self.blueView];
    gravity.magnitude = 100;
    // 3，添加行为
    [self.animator addBehavior:collision];
    [self.animator addBehavior:gravity];
}

/**
 碰撞行为
 */
-(void)textCollision
{
    // 1,创建碰撞行为
    UICollisionBehavior* collision = [[UICollisionBehavior alloc]init];
    [collision addItem:self.blueView];
    [collision addItem:self.segmentedControl];
    // 让参照视图bounds变为碰撞检测的边框
    collision.translatesReferenceBoundsIntoBoundary = YES;
    // 2，创建仿真行为
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc]init];
    [gravity addItem:self.blueView];
    gravity.magnitude = 100;
    // 3，添加行为
    [self.animator addBehavior:collision];
    [self.animator addBehavior:gravity];
}

/**
 重力行为
 */
-(void)textGravity
{
    // 2，创建仿真行为
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc]init];
    [gravity addItem:self.blueView];
    gravity.gravityDirection = CGVectorMake(100, 100);
    // 加速度
    gravity.magnitude = 100;// 100point/s2;
    // 3,添加物理仿真行为到物理仿真器中，开始仿真
    [self.animator addBehavior:gravity];
}

@end
