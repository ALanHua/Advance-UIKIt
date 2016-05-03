//
//  YHPOneViewController.m
//  02-导航控制器
//
//  Created by yhp on 16/4/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPOneViewController.h"
#import "YHPTwoViewController.h"

@interface YHPOneViewController ()

@end

@implementation YHPOneViewController

// 跳转第二个控制器
- (IBAction)jump2Two:(UIButton *)sender {
    UIViewController* vc = [[YHPTwoViewController alloc]init];
    vc.view.backgroundColor = [UIColor yellowColor];
//    push 就会把VC添加为导航控制器的子控制器
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"%@",self.navigationController);
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
