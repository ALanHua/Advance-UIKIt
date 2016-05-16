//
//  ViewController.m
//  UIView与核心动画的区别
//
//  Created by yhp on 16/5/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [UIView animateWithDuration:0.25 animations:^{
        _redView.layer.position = CGPointMake(150, 400);
        
    } completion:^(BOOL finished) {
        NSLog(@"%@",NSStringFromCGPoint( _redView.layer.position));
    }];
    
}

- (void)setUpRedViewBasicAnimation
{
    CABasicAnimation* anim = [CABasicAnimation animation];
    
    anim.keyPath = @"position";
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 400)];
    //  取消反弹/必须放在图层之前
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    anim.delegate = self;
    
    [_redView.layer addAnimation:anim forKey:nil];
}
/**
 *  注意：
    核心动画一切都是假象，并不会真实的改变图层的属性值，不需要与用户交互，一般用在转场
    UIView 必须修改层的属性值
 */

// 动画完成
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@",NSStringFromCGPoint( _redView.layer.position));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   NSLog(@"%@",NSStringFromCGPoint( _redView.layer.position));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
