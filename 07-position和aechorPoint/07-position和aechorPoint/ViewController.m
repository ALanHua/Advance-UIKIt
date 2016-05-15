//
//  ViewController.m
//  07-position和aechorPoint
//
//  Created by yhp on 16/5/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/**
 *  CGPoint position:
    用来设置CALayer在父层中的位置
    以父层的左上角为原点(0,0)
 */
/**
 *  CGPoint anchorPoint:
    称为定位点，锚点
    决定CALayer身上哪个点会在position属性所指的位置
     以自己的左上角为原点(0, 0)
     它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
