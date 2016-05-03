//
//  ViewController.m
//  04-抽屉效果
//
//  Created by yhp on 16/4/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.

//宏里面的#,会自动把后面的参数变成C语言的字符串
//逗号表达式 int a = (3,4,5) -->5
#define keyPath(objc,keyPath)  @(((void)objc.keyPath,#keyPath))

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak)UIView* mainV;
@property (nonatomic,weak)UIView* leftV;
@property (nonatomic,weak)UIView* rightV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    添加子控件
    [self setUpChildView];
//    添加Pan手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
//    利用KVO监听mainV的frame属性
//    addObserver：观察者
//    forKeyPath：监听的属性
//    options:监听新值得改变
//    context
    [_mainV addObserver:self forKeyPath:keyPath(_mainV,frame) options:NSKeyValueObservingOptionNew context:nil];

    // 什么情况下需要用到自动提示宏
    char* c = "abc";
    NSLog(@"%@",@(c));
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

-(void)dealloc
{
//    移除观察者
    [_mainV removeObserver:self forKeyPath:@"frame"];
}

#pragma mark - pan的方法
-(void)pan:(UIPanGestureRecognizer*)pan
{
    //    获取手势的移动位置
   CGPoint transP = [pan translationInView:self.view];
    //    获取X轴的偏移量
    CGFloat offsetX = transP.x;
    
    //    修改main的frame

   _mainV.frame = [self frameWithOffsetX:offsetX];
    
    //    复位
    [pan setTranslation:CGPointZero inView:self.view];
}

#pragma mark - 根据offsetX计算main的frame
-(CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    CGRect frame = _mainV.frame;
    frame.origin.x += offsetX;
    
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
