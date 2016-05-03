//
//  ViewController.m
//  03-偏好设置存储
//
//  Created by yhp on 16/4/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 偏好设置存储：
//好处：1，不需要关心文件名
//2，快速的做键值对存储
// 底层：封装了一个字典
// account:msg,pwd:123
- (IBAction)save:(UIButton *)sender {
    
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:@"xmg" forKey:@"account"];
    [userDefault setObject:@"123" forKey:@"pwd"];
    [userDefault setBool:YES forKey:@"rmbPwd"];
    // 在iOS7之前
    // 同步---相当于flush
    [userDefault synchronize];
    
}

- (IBAction)read:(UIButton *)sender {
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString* pwd = [userDefault objectForKey:@"rmbPwd"];
    NSLog(@"%@",pwd);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
