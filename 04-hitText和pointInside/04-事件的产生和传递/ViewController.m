//
//  ViewController.m
//  04-事件的产生和传递
//
//  Created by yhp on 16/4/21.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


// 点击白色： UIApplication->UIWindow(寻找最合适的View)
@implementation ViewController

//hitTest:ithEvent 作用就是用来寻找最合适的view
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.window hitTest:<#(CGPoint)#> withEvent:<#(nullable UIEvent *)#>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
