//
//  ViewController.m
//  03-Block使用
//
//  Created by yhp on 16/4/14.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

// name --类型别名
typedef void(^Myblock)(int a);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    如何定义block
//    void(^block)() = ^(){
//        NSLog(@"block");
//    };
//    调用block
    /**
     *  inline
     block();
     <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
            <#statements#>
        };
     */
    //  block类型：void(^)()
    int a = 0;
    Myblock myBlock = ^(int a){
        NSLog(@"%d",a);
    };
    myBlock(2);
    // 2，block作用:跟函数和方法很像，其实就是用来保存一段代码，等到恰当的时间去使用
    // 3，什么时候使用block,逆传：用block来传递，处理网路的时候经常使用block
    // 请求网路数据（延时），先把展示到控件的代码保存到block,等请求到数据时调用block
    // 4,通讯录Block使用：
    // 点击保存，通知联系人刷新表格，用代理
    // block:小弟，代理：打电话
    // block:先把shuax
    // 等用户点击就去调用他
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
