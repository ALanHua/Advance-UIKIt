//
//  ViewController.m
//  03-plist存储
//
//  Created by yhp on 16/4/14.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 点击存储的时候调用
- (IBAction)save:(UIButton *)sender {
    // plist: 数组和字典
    // 如何判断一个对象能不能使用Plist,就看有没有writeTofile
    //  plist存储不能存储自定义对象
    NSArray* arr = @[@"123",@3];
    // File:文件的全路径
//   NSString* homePath = NSHomeDirectory();
    //  获取caseh文件夹
    /**
     * 获取cachpath
     *  NSSearchPathDirectory 搜索的目录
     * NSSearchPathDomainMask 搜索的范围 NSUserDomainMask 在用户手机上查找
     * expandTilde 是否展开全路径，如果没有展开应用沙盒就是~
     * 存储一定要展开路径
     */
    NSString* cachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask , YES)[0];
//    拼接文件名
    NSString* filePath = [cachePath stringByAppendingPathComponent:@"arr.plist"];
    NSLog(@"%@",cachePath);
    [arr writeToFile:filePath atomically:YES];
}

- (IBAction)read:(UIButton *)sender {
    
    NSString* cachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask , YES)[0];
    //    拼接文件名
    NSString* filePath = [cachePath stringByAppendingPathComponent:@"arr.plist"];
    
    NSArray* arr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",arr);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
