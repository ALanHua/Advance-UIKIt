//
//  ViewController.m
//  04-抽屉效果
//
//  Created by yhp on 16/4/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.

//宏里面的#,会自动把后面的参数变成C语言的字符串
//逗号表达式 int a = (3,4,5) -->5
#define keyPath(objc,keyPath)  @(((void)objc.keyPath,#keyPath))
#define screenH  [UIScreen mainScreen].bounds.size.height
#define screenW  [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak)UIView* mainV;
@property (nonatomic,weak)UIView* leftV;
@property (nonatomic,weak)UIView* rightV;

@end
// 如果A控制器成为B控制器的子控件view要成为B的view,A控制器一定要成为B控制器的子控制器
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    添加子控件
    [self setUpChildView];
//    添加Pan手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
//    添加点按手势
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}
#pragma mark - 实现点按手势
- (void) tap
{
    [UIView animateWithDuration:0.5 animations:^{
        if (_mainV.frame.origin.x != 0) {
            _mainV.frame = self.view.bounds;
        }
    }];

}

// 只要监听的属性一改变，就会调用这个方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if(_mainV.frame.origin.x > 0){
        _rightV.hidden = YES;
    }else if (_mainV.frame.origin.x < 0){
        _rightV.hidden = NO;
    }
}
#define KTargetR 275
#define KTargetL -250

#pragma mark - pan的方法
-(void)pan:(UIPanGestureRecognizer*)pan
{
    //    获取手势的移动位置
   CGPoint transP = [pan translationInView:self.view];
    //    获取X轴的偏移量
    CGFloat offsetX = transP.x;
    //    修改main的frame
   _mainV.frame = [self frameWithOffsetX:offsetX];
    //    修改main的Frame
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    //    复位
    [pan setTranslation:CGPointZero inView:self.view];
    //   判断手势结束的时候，定位
    if(pan.state == UIGestureRecognizerStateEnded){
        //  定位
        CGFloat target = 0;
        //  1,判断main.x > 0 ,定位到右边 x = 275
        if(_mainV.frame.origin.x > screenW * 0.5){
            target = KTargetR;
        }else if(CGRectGetMaxX(_mainV.frame) < screenW * 0.5){
            target = KTargetL;
        }
        //   动画
        [UIView animateWithDuration:0.5 animations:^{
            _mainV.frame = (target == 0) ? self.view.bounds :
            [self frameWithOffsetX:(target - _mainV.frame.origin.x)];

        }];

    }
}

// 手指网往右移动，视图X抽也要往右移动，y抽往下移动(y值增加），尺寸缩放
#define kMaxY 80
#pragma mark - 根据offsetX计算main的frame
-(CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    // 获取上一次的frame
    CGRect frame = _mainV.frame;
    // 获取屏幕的高度
    // X轴每平移一点，Y轴需要移动
    CGFloat offsetY = offsetX * kMaxY / screenW;
    // 获取上一次的高度
    CGFloat preH = frame.size.height;
    // 获取上一次的宽度
    CGFloat preW = frame.size.width;
    // 获取当前的高度
    CGFloat curH = preH - 2 * offsetY;
    if (frame.origin.x < 0) { // 往左移动
        curH = preH + 2 * offsetY;
    }
    // 获取尺寸的缩放比例
    CGFloat scale = curH / preH;
    // 获取当前的宽度
    CGFloat curW = preW * scale;
    // 更改frame
    // 获取当前X
    frame.origin.x += offsetX;
    // 获取当前Y
    CGFloat y = (screenH - curH) / 2;
    frame.origin.y = y;
    frame.size.height = curH;
    frame.size.width = curW;
    return frame;
}

#pragma mark - 添加子控件
- (void)setUpChildView
{
//    left
    UIView* leftV= [[UIView alloc]initWithFrame:self.view.bounds];
    leftV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftV];
    _leftV = leftV;
//    right
    UIView* rightV= [[UIView alloc]initWithFrame:self.view.bounds];
    rightV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rightV];
    _rightV = rightV;
//    main
    UIView* mianV= [[UIView alloc]initWithFrame:self.view.bounds];
    mianV.backgroundColor = [UIColor redColor];
    [self.view addSubview:mianV];
    _mainV = mianV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
