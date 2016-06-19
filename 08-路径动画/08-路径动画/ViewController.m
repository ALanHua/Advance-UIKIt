//
//  ViewController.m
//  08-路径动画
//
//  Created by yhp on 16/6/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPDrawView.h"


@interface ViewController ()

@end

@implementation ViewController

- (IBAction)start:(UIButton *)sender {
    YHPDrawView* drawV = self.view;
    [drawV startAnim];
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
