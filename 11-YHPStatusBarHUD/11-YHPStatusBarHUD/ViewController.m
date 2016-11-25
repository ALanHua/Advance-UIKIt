//
//  ViewController.m
//  11-YHPStatusBarHUD
//
//  Created by yhp on 2016/11/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(UIButton *)sender {
  [YHPStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(UIButton *)sender {
    [YHPStatusBarHUD showError:@"加载失败"];
}
- (IBAction)loading:(UIButton *)sender {
    [YHPStatusBarHUD showLoading:@"正在加载"];
}
- (IBAction)hide:(UIButton *)sender {
    [YHPStatusBarHUD hide];
}

- (IBAction)message:(UIButton *)sender {
     [YHPStatusBarHUD showMessage:@"没什么事"];
}



@end
