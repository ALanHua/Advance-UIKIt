//
//  ViewController.m
//  08-活动指示器
//
//  Created by yhp on 16/5/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAReplicatorLayer* repL = [CAReplicatorLayer layer];
    repL.frame = _redView.bounds;
    [_redView.layer addSublayer:repL];
    
    CALayer* layer = [CALayer layer];
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    layer.position = CGPointMake(_redView.bounds.size.width * 0.5, 20);
    layer.bounds = CGRectMake(0, 0, 5, 5);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    [repL addSublayer:layer];
    //  设置缩放动画
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = @1;
    anim.toValue = @0.1;
    CGFloat duration = 0.5;
    anim.duration = duration;
    anim.repeatCount = MAXFLOAT;
    [layer addAnimation:anim forKey:nil];
    
    int count = 20;
    CGFloat angle = M_PI * 2 / count;
    //  设置子层总是
    repL.instanceCount = count;
    repL.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    repL.instanceDelay = duration / count ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
