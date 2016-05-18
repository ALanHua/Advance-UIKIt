//
//  ViewController.m
//  08-折叠图片
//
//  Created by yhp on 16/5/18.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *dragView;
@property(nonatomic,strong)CAGradientLayer* gradient;

@end

@implementation ViewController
// 一张图片必须要通过两个控件展示，旋转的时候，只旋转上部分
//  如何通过让一张完整的图片通过两个控件显示
//  通过layer控制图片的显示内容
//  如何快速把两个控件拼接成一个完整图片

- (void)viewDidLoad {
    [super viewDidLoad];
    //  通过设置contentsRect可以设置图片显示的尺寸，取值0-1
    _topView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    _topView.layer.anchorPoint =  CGPointMake(0.5, 1);
    
    _bottomView.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    _bottomView.layer.anchorPoint = CGPointMake(0.5, 0);

    //  添加手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [_dragView addGestureRecognizer:pan];
    
    //  渐变图层
    CAGradientLayer* gradient = [CAGradientLayer layer];
    //  注意图层需要尺寸
    gradient.frame = _bottomView.bounds;
    gradient.opacity = 0;
    
    gradient.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
//   gradient.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor yellowColor].CGColor];
//    gradient.locations = @[@0.1,@0.4,@0.5];
//    gradient.startPoint = CGPointMake(0, 1);
    _gradient = gradient;
    
    [_bottomView.layer addSublayer:gradient];
}

#pragma mark - 手势处理函数
-(void)pan:(UIPanGestureRecognizer*)pan
{
    // 获取偏移量
    CGPoint transP = [pan translationInView:_dragView];
    // 转换角度，逆时针旋转
    CGFloat angle =  -transP.y / 200.0 * M_PI;
    // 增加立体感
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 5.0;
    
    transform = CATransform3DMakeRotation(angle, 1, 0, 0);
    
    _topView.layer.transform = transform;
    
    _gradient.opacity = transP.y / 200.0;
    
    if (pan.state == UIGestureRecognizerStateEnded) {// 反弹
        // usingSpringWithDamping 值越小，弹性越大
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _topView.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
  
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
