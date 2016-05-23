//
//  ViewController.m
//  09-微博动画
//
//  Created by yhp on 16/5/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPComposeViewController.h"
#import "YHPMenuItem.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 点击加号按钮
- (IBAction)btnClick:(UIButton *)sender {
    YHPComposeViewController* vc = [[YHPComposeViewController alloc]init];
    vc.item = [self itemArray];
    [self presentViewController:vc animated:YES completion:nil];
    
}

-(NSArray*)itemArray
{
    YHPMenuItem *item = [YHPMenuItem itemWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    YHPMenuItem *item1 = [YHPMenuItem itemWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    YHPMenuItem *item2 = [YHPMenuItem itemWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    YHPMenuItem *item3 = [YHPMenuItem itemWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    YHPMenuItem *item4 = [YHPMenuItem itemWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    YHPMenuItem *item5 = [YHPMenuItem itemWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    return @[item,item1,item2,item3,item4,item5];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
