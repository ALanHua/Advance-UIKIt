//
//  ViewController.m
//  07-CALyer隐式动画
//
//  Created by yhp on 16/5/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

#define angle2radion(angle) ((angle) / 180 * M_PI)

@interface ViewController ()
/**  */
@property(nonatomic,weak)CALayer* layer;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

/**
 *  隐式动画只有非Root层的layer具有
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer* layer = [CALayer layer];
    layer.position = CGPointMake(200, 150);
    layer.anchorPoint = CGPointZero;
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //  旋转
    // 1-359
    _blueView.layer.transform = CATransform3DMakeRotation(angle2radion(arc4random_uniform(360)+1), 0, 0, 1);
    
    _blueView.layer.position = CGPointMake(arc4random_uniform(200), arc4random_uniform(400));
    _blueView.layer.cornerRadius = arc4random_uniform(50);
    _blueView.layer.backgroundColor = [self randomColor].CGColor;
    _blueView.layer.borderWidth = arc4random_uniform(10);
    _blueView.layer.backgroundColor = [self randomColor].CGColor;
    
}

- (UIColor*)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
