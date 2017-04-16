//
//  ViewController.m
//  15-Runtime_MethodSwizzle
//
//  Created by yhp on 2017/4/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Method method1 = class_getInstanceMethod([YHPPerson class], @selector(run));
//    Method method2 = class_getInstanceMethod([YHPPerson class], @selector(study));
//    method_exchangeImplementations(method1, method2);
//    
//    YHPPerson* p = [[YHPPerson alloc]init];
//    [p run];
//    [p study];
    
}


@end
