//
//  YHPModalViewController.m
//  04-modal简单使用
//
//  Created by yhp on 16/4/20.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPModalViewController.h"


@interface YHPModalViewController ()

@end

@implementation YHPModalViewController

// 退出modal控制器
- (IBAction)dismiss:(UIButton *)sender {

    //  modal 出谁，谁就有权利dismiss
    //  谁modal控制器，谁也有权利dismiss
//    [self dismissViewControllerAnimated:YES completion:nil];
    

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
