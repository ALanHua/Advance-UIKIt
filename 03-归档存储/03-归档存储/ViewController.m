//
//  ViewController.m
//  03-归档存储
//
//  Created by yhp on 16/4/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)save:(UIButton *)sender {
    YHPPerson* p = [[YHPPerson alloc]init];
    p.age = 18;
    //  获取cache
    NSString* cachPpath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    //  获取文件全路径
    NSString* filePath = [cachPpath stringByAppendingPathComponent:@"person.data"];
    //  把自定义归档
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}

- (IBAction)read:(UIButton *)sender {
    //  接档
    //  获取cache
    NSString* cachPpath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    //  获取文件全路径
    NSString* filePath = [cachPpath stringByAppendingPathComponent:@"person.data"];
     [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    YHPPerson* p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%d",p.age);
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
