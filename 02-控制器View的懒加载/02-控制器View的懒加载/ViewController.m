//
//  ViewController.m
//  02-控制器View的懒加载
//
//  Created by yhp on 16/4/6.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
//    如果控制器是窗口的根控制器就可以不用设置尺寸
    self.view = [[UIView alloc]initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor yellowColor];

}
// 控制器加载完成时候调用
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
}

#pragma mark - View完成显示的时候调用
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@", NSStringFromCGRect(self.view.bounds));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
