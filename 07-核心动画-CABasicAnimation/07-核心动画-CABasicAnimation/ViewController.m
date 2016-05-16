//
//  ViewController.m
//  07-核心动画-CABasicAnimation
//
//  Created by yhp on 16/5/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //  创建动画
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.toValue = @0.5;
    //  设置执行次数
    anim.repeatCount = MAXFLOAT;
    //  取消回弹
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [_imageView.layer addAnimation:anim forKey:nil];
}

-(void)setUpRedViewBasicAnimation
{
    //  创建动画
    CABasicAnimation* anim = [CABasicAnimation animation];
    //  描述下修改哪个属性产生动画
    //    anim.keyPath = @"position";
    anim.keyPath = @"transform.scale";
    //  设置值
    //    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 500)];
    anim.toValue = @0.5;
    //  设置执行次数
    anim.repeatCount = MAXFLOAT;
//  取消动画回弹必须要写下面两部
    //  设置动画完成的时候不要移除动画
    anim.removedOnCompletion = NO;
    //  设置动画执行完成要保存最新的效果
    anim.fillMode = kCAFillModeForwards;
//  取消动画回弹必须要写下面两部
    //  添加动画
    [_redView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
