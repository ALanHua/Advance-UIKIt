//
//  ViewController.m
//  03-导航条内容
//
//  Created by yhp on 16/4/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//  控制器加载完成时调用，只会调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
//    设置导航条的内容
    self.title = @"第一个控制器";
//    中间内容文字的标题
//    self.navigationController.navigationItem.title = @"第一个控制器";
//    self.navigationItem.title = @"第一个控制器";
//    中间的View
//    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    在iOS7默认会把导航条上面的按钮渲染成蓝色
//    左边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左边" style:UIBarButtonItemStyleDone target:self action:@selector(btnClick)];
//    右边按钮
//    通过代码告诉苹果不要渲染图片
    UIImage* image = [UIImage imageNamed:@"navigationbar_friendsearch"];
//    告诉image 不要渲染图片
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:nil action:nil];
   
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
//    导航条上的内容的位置不能由开发者决定
//    btn.frame = CGRectMake(200, 200, 30, 30);
//    控件的尺寸有图片决定
//    仅仅设置尺寸
    [btn sizeToFit];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}
/*
 只要带有Item,一般都是苹果提供的模型
 UINavigationItem // 控制导航条内容
 UIBarButtonItem  // 控制导航条按钮的内容
 */
- (void)btnClick
{
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
