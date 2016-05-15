//
//  ViewController.m
//  07-CALayer新建图层
//
//  Created by yhp on 16/5/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  UIView 可以相应用户事件，而CAlayer不能
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    创建图层
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50, 200, 200);
    layer.backgroundColor = [[UIColor redColor] CGColor];
//   图层设置内容
    layer.contents = (id)[UIImage imageNamed:@"阿狸头像"].CGImage;
    
    [self.view.layer addSublayer:layer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
