//
//  ViewController.m
//  06-图片水印
//
//  Created by yhp on 16/5/4.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

// 在图片的基础上做一些文字和log,最终生成一张照片
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  加载图片
    UIImage* image = [UIImage imageNamed:@"小黄人"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //  获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //  描述上细文
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 200, 200);
    [[UIColor redColor]set];
    //  渲染上下文
    CGContextStrokePath(ctx);
    
    UIImage* imageWater = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    //  展示图片
    _imageView.image = imageWater;

}

- (void)drawImageWater
{
    //  加载图片
    UIImage* image = [UIImage imageNamed:@"小黄人"];
    // 0，获取上下文，之前在drawRect里获取的
    // 怎么获取位图上下文，位图上下文获取需要我们手动创建
    //  开启一个上下文，位图上下文和View无关系
    /*
     size: 画板尺寸(新图片的尺寸）
     opaque: 不透明度，YES--不透明 NO--透明，一般都用透明的
     scale: 缩放，一般不需要缩放
     */
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 1，绘制原生的照片
    [image drawAtPoint:CGPointZero];
    // 2，给原生的图片添加文字
    NSString* str = @"Andy";
    // 创建字典属性
    NSMutableDictionary* dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = [UIColor redColor];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [str drawAtPoint:CGPointMake(200, 528) withAttributes:dictM];
    // 3，生成一张图片给我们,从上下文从获取图片
    UIImage* imageWater = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    //  展示图片
    _imageView.image = imageWater;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
