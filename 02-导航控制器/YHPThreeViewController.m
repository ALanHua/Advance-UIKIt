//
//  YHPThreeViewController.m
//  02-导航控制器
//
//  Created by yhp on 16/4/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPThreeViewController.h"

@interface YHPThreeViewController ()

@end

@implementation YHPThreeViewController

// 返回上一个控制器
- (IBAction)backToPre:(UIButton *)sender {
//     pop 不是马上销毁控制器
    [self.navigationController popViewControllerAnimated:YES];
}
// 返回根控制器
- (IBAction)backToRoot:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
