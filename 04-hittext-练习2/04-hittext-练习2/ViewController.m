//
//  ViewController.m
//  04-hittext-练习2
//
//  Created by yhp on 16/4/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPPopBtn.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)popChatView:(YHPPopBtn *)sender {
//    弹出对话框
    UIButton* chatView = [UIButton buttonWithType:UIButtonTypeCustom];
    chatView.bounds = CGRectMake(0, 0, 200, 200);
    chatView.center = CGPointMake(100, -100);
    [chatView setBackgroundImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [chatView setBackgroundImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    sender.chatView = chatView;
    [sender addSubview:chatView];
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
