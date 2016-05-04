//
//  ViewController.m
//  06-图片裁剪
//
//  Created by yhp on 16/5/4.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 图片裁剪
//    0，加载图片
    UIImage* image = [UIImage imageNamed:@"阿狸头像"];
//    1，开启位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//    2，设置圆形裁剪区域，正切与图片
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //    把路径设置为裁剪区域
    [path addClip];
//    3，绘制图片
    [image drawAtPoint:CGPointZero];
//    4，从上下文中获取图片
    UIImage* clipImage = UIGraphicsGetImageFromCurrentImageContext();
    _imageView.image = clipImage;
    //    5，关闭上下文
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
