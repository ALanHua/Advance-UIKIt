//
//  ViewController.m
//  05-模仿UIImageView
//
//  Created by yhp on 16/5/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPUIimageView.h"

@interface ViewController ()

/** 图片 */
@property(nonatomic,strong)UIImageView* imageV;
@end

@implementation ViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
//    UIImageView* imageV = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 200, 350)];
//    imageV.image = [UIImage imageNamed:@"汽水"];
//     _imageV = imageV;
//    
////     默认把控件填充
//    [self.view addSubview:imageV];
    
//    YHPUIimageView* imageView = [[YHPUIimageView alloc]initWithFrame:CGRectMake(50, 50, 200, 350)];
//    imageView.image = [UIImage imageNamed:@"汽水"];
//    
//    _imageV = (UIImageView*)imageView;
//    
//    [self.view addSubview:imageView];
    
    YHPUIimageView * imageView = [[YHPUIimageView alloc]initWithImage:[UIImage imageNamed:@"汽水"]];
    
     [self.view addSubview:imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _imageV.image =  [UIImage imageNamed:@"CTO"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
