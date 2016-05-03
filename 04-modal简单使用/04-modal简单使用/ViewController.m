//
//  ViewController.m
//  04-modal简单使用
//
//  Created by yhp on 16/4/20.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPModalViewController.h"

@interface ViewController ()
/**  */
@property(nonatomic,strong)id presentVC;
@end

@implementation ViewController
// 注意：以后要把一个控制器的view添加到自己控制器的上面，一定要保证这个控制器不要被销毁
// 点击Modal
- (IBAction)modal:(UIButton *)sender {
    
//    modal 一个控制器
    UIViewController* vc = [[YHPModalViewController alloc]init];
    vc.view.backgroundColor = [UIColor yellowColor];
    
    //  模仿modal效果，modal出来的控制器添加窗口上面
    //   以后一个控件只要想显示到最前面，就添加窗口上
    //   获取窗口
//    UIWindow* window = [UIApplication sharedApplication].keyWindow;
//    
//    [window addSubview:vc.view];
//    
//    
//    vc.view.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
//
//    [UIView animateWithDuration:0.25 animations:^{
//        //  清空形变
//        vc.view.transform = CGAffineTransformIdentity;
//    }];
//    //  强引用
//    self.presentVC = vc;
    [self presentViewController:vc animated:YES completion:nil];
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
