//
//  ViewController.m
//  06-图片擦除
//
//  Created by yhp on 16/5/5.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
    
}

-(void)pan:(UIPanGestureRecognizer*)pan
{
    // 获取当前点
    CGPoint curP = [pan locationInView:self.view];
    CGFloat wh = 30;
    CGFloat x = curP.x - wh * 0.5;
    CGFloat y = curP.y - wh * 0.5;
    CGRect rect = CGRectMake(x, y, wh, wh);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 渲染layer
    [_imageV.layer renderInContext:ctx];
    // 擦除图片
    CGContextClearRect(ctx, rect);
    _imageV.image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
