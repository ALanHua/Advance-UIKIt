//
//  ViewController.m
//  07-CALayer基本使用
//
//  Created by yhp on 16/5/14.
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    图层形变
    //    缩放
    
    [UIView animateWithDuration:1 animations:^{
//      _redView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
//        _redView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
    //    快速进行图层缩放，KVC
//        [_redView.layer setValue:@0.5 forKeyPath:@"transform.scale"];
    
    }];
    
    
}

-(void)imageViewLayer
{
    //   cornerRadius设置控件的主层边框
    _imageView.layer.cornerRadius = 50;
    NSLog(@"%@",_imageView.layer.contents);
    //   超出主层边框的内容全部裁剪掉
    _imageView.layer.masksToBounds = YES;
    //    设置边宽
    _imageView.layer.borderWidth = 5;
    _imageView.layer.borderColor = [[UIColor yellowColor]CGColor];
    //   如何判断以后是否需要裁剪图片，就判断下需要显示图片控件是否是正方形
}

-(void)viewLayer
{
    // Opacity 不透明
    _redView.layer.shadowOpacity = 1;
    //    _redView.layer.shadowOffset   = CGSizeMake(10, 10);
    //  涂成的颜色都是核心绘图框架的，通常CGColor
    _redView.layer.shadowColor = [UIColor yellowColor].CGColor;
    _redView.layer.shadowRadius = 10;
    //  圆角半径
    _redView.layer.cornerRadius = 50;
    // 边宽
    _redView.layer.borderWidth = 1;
    _redView.layer.borderColor = [[UIColor whiteColor] CGColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
