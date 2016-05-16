//
//  ViewController.m
//  07-CATransition转场动画
//
//  Created by yhp on 16/5/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

static int i = 2;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    转场代码
    if (i == 4) {
        i = 1;
    }
    //  加载图片
    NSString* imageN = [NSString stringWithFormat:@"%d",i];
    _imageView.image = [UIImage imageNamed:imageN];
    i++;
    //  转场动画
    CATransition* anim = [CATransition animation];
    /**
    type 类型
        fade               交叉淡化过渡
        push               新视图把旧视图推出去
        moveIn             新视图移到旧视图上面
        reveal             将旧视图移开,显示下面的新视图
        cube                立方体翻滚效果
        oglFlip             上下左右翻转效果
        suckEffect          收缩效果，如一块布被抽走
        rippleEffect        水滴效果
        pageCurl
        pageUnCurl
        cameraIrisHollowOpen
        cameraIrisHollowClose
     */
    anim.type = @"pageUnCurl";
    
    anim.duration = 2;
    
    [_imageView.layer addAnimation:anim forKey:nil];
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
