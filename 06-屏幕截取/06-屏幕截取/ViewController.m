//
//  ViewController.m
//  06-屏幕截取
//
//  Created by yhp on 16/5/5.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YHPImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageWithCaptureView:self.view];
    
//    NSData* data = UIImagePNGRepresentation(image);
    NSData* data = UIImageJPEGRepresentation(image, 1);
    //  写入桌面
    [data writeToFile:@"/Users/smartwater/Desktop//view.jpg" atomically:YES];
    
}

-(void)captureImage
{
    //   生成一张新的图片
    
    //  开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    //  获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //  把控件上的涂成渲染到上下文
    [self.view.layer renderInContext:ctx];
    //  生成一张图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    //  生成什么格式的图片
    NSData* data = UIImagePNGRepresentation(image);
    //  写入桌面
    [data writeToFile:@"/Users/smartwater/Desktop//view.png" atomically:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
