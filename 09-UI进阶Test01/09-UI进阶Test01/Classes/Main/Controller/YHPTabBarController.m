//
//  YHPTabBarController.m
//  09-UI进阶Test01
//
//  Created by yhp on 16/6/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPTabBarController.h"
// 子控制器头文件
#import "YHPBookMarkController.h"
#import "YHPContactViewController.h"

@interface YHPTabBarController ()

@end

@implementation YHPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    添加子控制器
    [self setUpChildViewController];
    
}


#pragma mark - 添加子控制器
- (void)setUpChildViewController
{
//    联系人
    YHPContactViewController* contact = [[YHPContactViewController alloc] init];
    [self setUpOneChildViewController:contact tittle:@"联系人" backgroudColor:[UIColor redColor] tabBarItem:UITabBarSystemItemContacts];
//   书签
    YHPBookMarkController* bookMark = [[YHPBookMarkController alloc]init];
    [self setUpOneChildViewController:bookMark tittle:@"书签" backgroudColor:[UIColor grayColor] tabBarItem:UITabBarSystemItemBookmarks];
    
}


-(void)setUpOneChildViewController:(UIViewController*)vc tittle:(NSString*)tittle backgroudColor:(UIColor*)backgroudColor tabBarItem:(UITabBarSystemItem)tabBarItem
{
    vc.navigationItem.title = tittle;
    vc.view.backgroundColor = backgroudColor;
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.tabBarItem =  [[UITabBarItem alloc]initWithTabBarSystemItem:tabBarItem tag:1];
    [self addChildViewController:nav];
}

@end
