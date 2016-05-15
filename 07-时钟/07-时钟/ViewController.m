//
//  ViewController.m
//  07-时钟
//
//  Created by yhp on 16/5/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#define KClockW         _clockView.bounds.size.width
#define KClockH         _clockView.bounds.size.height

#define KClockSecondW   1
#define KClockSecondH   KClockH * 0.5 - 20      // 秒
#define KClockMinuteW   4
#define KClockMinuteH   KClockSecondH           // 分
#define KClockHourW     4
#define KClockHourH     KClockMinuteH - 20      // 时

#define angle2Radian(a) ((a) / 180 * M_PI)
//  秒/分/时 单位时间旋转度数
#define perSecondA      6                       // 秒
#define perMinuteA      6                       // 分
#define perHourA        30                      // 时
#define perMinuteHourA  0.5                     // 每分钟时钟转的角度
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
//  添加时钟秒分时探针
@property(nonatomic,weak)CALayer* secondLayer;
@property(nonatomic,weak)CALayer* minuteLayer;
@property(nonatomic,weak)CALayer* hourLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHourLayer];                  //  添加时针
    [self setUpMinuteLayer];                //  添加分针
    [self setUpSecondLayer];                //  添加秒针
    //  添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChage) userInfo:nil repeats:YES];
    
    [self timeChage];
}

-(void)timeChage
{
    //  获取当前系统时间
    // 获取当前日历对象
    NSCalendar* calendar = [NSCalendar currentCalendar];
    // 获取日期组件
    /**
     *  component:需要获取的日期组件
     *  fromDate： 获取那个日期的组件
     */
    NSCalendarUnit type = NSCalendarUnitSecond |
                          NSCalendarUnitMinute |
                          NSCalendarUnitHour;
    
    NSDateComponents* cmp = [calendar components:type fromDate:[NSDate date]];
    //  旋转秒针
    //  计算秒针赚多少度
    CGFloat secondA = perSecondA * cmp.second;
    CGFloat minuteA = perMinuteA * cmp.minute;
    CGFloat hourA   = perMinuteHourA * minuteA + perHourA * cmp.hour;
    _secondLayer.transform = CATransform3DMakeRotation(angle2Radian(secondA), 0, 0, 1);
    _minuteLayer.transform = CATransform3DMakeRotation(angle2Radian(minuteA), 0, 0, 1);
    _hourLayer.transform = CATransform3DMakeRotation(angle2Radian(hourA), 0, 0, 1);
}
#pragma mark - 添加秒针
- (void)setUpSecondLayer
{
    CALayer* layer = [CALayer layer];
    layer.backgroundColor = [[UIColor redColor] CGColor];
    // 设置锚点
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(KClockW*0.5, KClockH*0.5);
    layer.bounds = CGRectMake(0, 0, KClockSecondW, KClockSecondH);
    layer.cornerRadius = 4; //设置圆角
    [_clockView.layer addSublayer:layer];
    
    _secondLayer = layer;
}

#pragma mark - 添加分针
- (void)setUpMinuteLayer
{
    CALayer* layer = [CALayer layer];
    layer.backgroundColor = [[UIColor blackColor] CGColor];
    // 设置锚点
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(KClockW*0.5, KClockH*0.5);
    layer.bounds = CGRectMake(0, 0, KClockMinuteW, KClockMinuteH);
    layer.cornerRadius = 4; //设置圆角
    [_clockView.layer addSublayer:layer];
    
    _minuteLayer = layer;
}

#pragma mark - 添加分针
- (void)setUpHourLayer
{
    CALayer* layer = [CALayer layer];
    layer.backgroundColor = [[UIColor blackColor] CGColor];
    // 设置锚点
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(KClockW*0.5, KClockH*0.5);
    layer.bounds = CGRectMake(0, 0, KClockHourW, KClockHourH);
    layer.cornerRadius = 4; //设置圆角
    [_clockView.layer addSublayer:layer];
    
    _hourLayer = layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
