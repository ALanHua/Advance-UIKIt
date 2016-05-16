//
//  ViewController.m
//  07-核心动画-CAKeyFrameAnimation
//
//  Created by yhp on 16/5/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

#define angle2radian(angle)     ((angle) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _imageView.layer.anchorPoint = CGPointZero;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}


-(void)setUpImageViewWithCAKeyframeAnimation
{
    //  核心动画
    CAKeyframeAnimation* anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 100, 100)].CGPath;
    anim.duration = 1;
    //    anim.values = @[@(angle2radian(-5)),@(angle2radian(5)),@(angle2radian(-5))];
    anim.repeatCount = MAXFLOAT;
    
    [_imageView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
