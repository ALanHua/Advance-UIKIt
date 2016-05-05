//
//  ViewController.m
//  06-图片截取
//
//  Created by yhp on 16/5/5.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,assign)CGPoint startP;
@property(nonatomic,strong)UIView* clipView;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (UIView *)clipView
{
    if (_clipView == nil) {
        UIView* view = [[UIView alloc]init];
        _clipView = view;
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        [self.view addSubview:view];
    }
    
    return _clipView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    控制器的view添加pan手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer*)pan
{
    CGPoint endA  = CGPointZero;
    if (pan.state == UIGestureRecognizerStateBegan) {//一开始拖动
        _startP = [pan locationInView:self.view];
    }else if(pan.state == UIGestureRecognizerStateChanged){
        endA = [pan locationInView:self.view];
        //  生成截屏的view
        CGFloat w = endA.x -_startP.x;
        CGFloat h = endA.y -_startP.y;
        // 获取截取范围
        CGRect clipRect = CGRectMake(_startP.x, _startP.y, w, h);
        self.clipView.frame = clipRect;
    }else if (pan.state == UIGestureRecognizerStateEnded){// 生成矩形范围
// 图片的裁剪
        // 开始上下文
        UIGraphicsBeginImageContextWithOptions(_imageV.bounds.size, NO, 0);
        // 设置裁剪区域
        UIBezierPath* path = [UIBezierPath bezierPathWithRect:_clipView.frame];
        [path addClip];
        // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        //  渲染上下文
        [_imageV.layer renderInContext:ctx];
        //  生成一张新的图片
        _imageV.image = UIGraphicsGetImageFromCurrentImageContext();
        //  关闭上下文
        UIGraphicsEndImageContext();
        //  截取的view设置为nil
        [_clipView removeFromSuperview];
        _clipView = nil;
    }
    
    //  获取开始触摸点

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
