//
//  ViewController.m
//  06-图片裁剪
//
//  Created by yhp on 16/5/4.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YHPImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage* image = [UIImage imageWithClipImage:[UIImage imageNamed:@"阿狸头像"] border:1 borderWithColor:[UIColor yellowColor]];
    _imageView.image = image;
}


-(void)clipImageWithBorder
{
    //    0,加载图片
    UIImage* image = [UIImage imageNamed:@"阿狸头像"];
    // 图片宽高一致
    CGFloat imageW = image.size.width;
    CGFloat border = 1;
    CGFloat ovalWH = imageW + 2 * border;
    //    1,开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    //    2,画大圆
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    [[UIColor greenColor]set];
    [path fill];
    //    3,设置裁剪区域
    UIBezierPath* clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border,imageW,imageW)];
    [clipPath addClip];
    //    4,绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    //    5,获取图片
    UIImage* clipImage = UIGraphicsGetImageFromCurrentImageContext();
    _imageView.image = clipImage;
    //    关闭上下文
    UIGraphicsEndImageContext();
}
-(void)clipImage
{
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
