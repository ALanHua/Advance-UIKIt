//
//  ViewController.m
//  02-UIApplication
//
//  Created by yhp on 16/3/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)btnClick:(UIButton *)sender {
    // URL:资源路径
    // URL:协议头://路径
    // 协议头：
    // 打开网页
     [[UIApplication sharedApplication]openURL: [NSURL URLWithString:@"http://wwww.baidu.com"]];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIApplication* app = [UIApplication sharedApplication];
    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    // 隐藏状态栏
    
    
}

// 状态栏默认由控制器决定
//  影藏状态栏
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

-(void)application
{
    // 1,整个app中只有一个UIApplication
    // 2,用来做一些应用级别的操作
    UIApplication* app = [UIApplication sharedApplication];
    // 设置appIcon的提醒数字
    // 创建用户通知
    UIUserNotificationSettings* setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    // 注册用户通知
    [app registerUserNotificationSettings:setting];
    app.applicationIconBadgeNumber = 10;
    // 设置联网状态
    app.networkActivityIndicatorVisible = YES;
    
    //  打开网页
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
