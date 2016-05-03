//
//  YHPTwoViewController.m
//  02-导航控制器
//
//  Created by yhp on 16/4/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPTwoViewController.h"
#import "YHPThreeViewController.h"

@interface YHPTwoViewController ()

@end

@implementation YHPTwoViewController

- (IBAction)jump2Three:(UIButton *)sender {
    
    UIViewController* vc = [[YHPThreeViewController alloc]init];

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
