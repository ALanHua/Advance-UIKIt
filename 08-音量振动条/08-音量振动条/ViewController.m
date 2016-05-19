//
//  ViewController.m
//  08-音量振动条
//
//  Created by yhp on 16/5/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *lightView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  负责图层，可以把图层里面的所有子层负责
    //  创建复制图层
    CAReplicatorLayer* repL = [CAReplicatorLayer layer];
    repL.frame = _lightView.bounds;
    [_lightView.layer addSublayer:repL];
//    
    CALayer* layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(15, _lightView.bounds.size.height);
    layer.bounds = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [repL addSublayer:layer];
    //  添加动画
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0.5;
    anim.duration = 0.5;
    anim.repeatCount = MAXFLOAT;
    //  设置动画反转
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
//    
    //  复制子层
    //  instanceCount: 复制层有多少个子层
    repL.instanceCount = 3;
    //  设置复制子层的偏移量,不包括原始层
    repL.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    //  设置复制层动画延迟时间
    repL.instanceDelay = 0.1;
    repL.instanceColor = [UIColor greenColor].CGColor;
    repL.instanceGreenOffset = -0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
