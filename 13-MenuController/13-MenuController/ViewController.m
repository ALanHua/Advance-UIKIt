//
//  ViewController.m
//  13-MenuController
//
//  Created by yhp on 2017/1/4.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet YHPLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];

    [self.label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)]];

}

/**
 ding
 @param menu 菜单控制器
 */
-(void)ding:(UIMenuController*)menu
{
    NSLog(@"%s",__func__);
}

/**
 replay
 @param menu 菜单控制器
 */
-(void)replay:(UIMenuController*)menu
{
    NSLog(@"%s",__func__);
}

/**
 report
 @param menu 菜单控制器
 */
-(void)report:(UIMenuController*)menu
{
    NSLog(@"%s",__func__);
}

-(void)labelClick
{
    // 1,label要成为第一响应者
    [self.label becomeFirstResponder];
    // 2,显示MenuController
    UIMenuController* menu = [UIMenuController sharedMenuController];
    // targetRect: 以UIMenuController需要指向的矩形框
    // targetView: 以targetView左上角作为坐标原点
    UIMenuItem* ding = [[UIMenuItem alloc]initWithTitle:@"顶" action:@selector(ding:)];
    UIMenuItem* replay = [[UIMenuItem alloc]initWithTitle:@"恢复" action:@selector(ding:)];
    UIMenuItem* report = [[UIMenuItem alloc]initWithTitle:@"举报" action:@selector(ding:)];
    menu.menuItems = @[ding,replay,report];
    
    [menu setTargetRect:self.label.bounds inView:self.label];
    
    [menu setMenuVisible:YES animated:YES];
    
}

@end
