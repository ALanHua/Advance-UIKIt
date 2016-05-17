//
//  ViewController.m
//  07-转盘
//
//  Created by yhp on 16/5/17.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPWheelView.h"

@interface ViewController ()

@property(nonatomic,weak)YHPWheelView* wheelView;

@end

@implementation ViewController
- (IBAction)startRotation:(UIButton *)sender {
    [_wheelView start];
}

- (IBAction)pauseRotation:(UIButton *)sender {
    [_wheelView pause];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //  添加转盘view
    YHPWheelView* view = [YHPWheelView wheelView];
    _wheelView = view;
    view.center = self.view.center;

    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
