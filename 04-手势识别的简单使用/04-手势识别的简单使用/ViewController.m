//
//  ViewController.m
//  04-手势识别的简单使用
//
//  Created by yhp on 16/4/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //  创建点按手势
    [self setUpPan];
}

#pragma mark - 点按手势
- (void)setUpTap
{

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 2;
    tap.delegate = self;
    
    [_imageView addGestureRecognizer:tap];
}

-(void)tap:(UITapGestureRecognizer*)tap
{
    NSLog(@"%s",__func__);
}
#pragma mark - 长按代理
// 长按默认调用两次
- (void)setUpLongPress
{
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(longPress:)];
    [self.imageView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer*)longPress
{
    if (longPress.state == UIGestureRecognizerStateEnded) {
         NSLog(@"%s",__func__);
    }
}

#pragma mark - 请扫手势
- (void)setUpSwipe
{
    //    默认清扫手势默认方向是往右
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self.imageView addGestureRecognizer:swipe];
//    如果要支持多个方向处理事件，必须创建多个清扫手势
    UISwipeGestureRecognizer* swipeDown = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(swipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.imageView addGestureRecognizer:swipeDown];
}

-(void)swipe:(UISwipeGestureRecognizer*)swipe
{
      NSLog(@"%s",__func__);
}

#pragma mark - 创建旋转手势
-(void)setUpRotation
{
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    
    [self.imageView addGestureRecognizer:rotation];
}

-(void)rotation:(UIRotationGestureRecognizer*)rotation
{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
//    获取手势旋转角度
    //  复位
    rotation.rotation = 0;
    
    NSLog(@"%f",rotation.rotation);
}
#pragma mark - 捏合
- (void)setUpPinch
{
    UIPinchGestureRecognizer* pich = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pich:)];
    
    [self.imageView addGestureRecognizer:pich];
}

-(void)pich:(UIPinchGestureRecognizer*)pich
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pich.scale, pich.scale);
//    复位
    pich.scale = 1;
    NSLog(@"%s",__func__);
}

#pragma mark - 拖拽
- (void)setUpPan
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    
    [self.imageView addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取手势的触摸点
    // CGPoint curP = [pan locationInView:self.imageView];
    
    // 移动视图
    // 获取手势的移动，也是相对于最开始的位置
    CGPoint transP = [pan translationInView:self.imageView];
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transP.x, transP.y);
    
    // 复位
    [pan setTranslation:CGPointZero inView:self.imageView];
    
    //  NSLog(@"%@",NSStringFromCGPoint(curP));
}
// 是否允许同时支持多个手势，默认不支持
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 是否允许接收的触摸点
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
//{
//    CGPoint curP = [touch locationInView:self.imageView];
//    
//    if (curP.x < self.imageView.bounds.size.width * 0.5) {
//        return NO;
//    }else{
//        return YES;
//    }
//    
//}


@end
