//
//  ViewController.m
//  08-离子效果单路径
//
//  Created by yhp on 16/5/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPDrawView.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 开始动画时调用
- (IBAction)startAnimation:(UIButton *)sender {
    
    YHPDrawView* view = (YHPDrawView*)(self.view);
    [view startAnim];
}
- (IBAction)reDraw:(UIButton *)sender {
    
    YHPDrawView* view = (YHPDrawView*)(self.view);
    [view reDraw];
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
