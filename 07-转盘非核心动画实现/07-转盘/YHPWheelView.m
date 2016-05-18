//
//  YHPWheelView.m
//  07-转盘
//
//  Created by yhp on 16/5/17.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPWheelView.h"
#import "YHPWheelButton.h"

#define angle2Radian(angle)    ((angle) / 180.0 * M_PI)
#define BTN_ROTATION_ANGLE      30

@interface YHPWheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *centerView;
@property(nonatomic,weak)UIButton* selBtn;
@property(nonatomic,strong)CADisplayLink* link;

@end

@implementation YHPWheelView

-(CADisplayLink*)link
{
    if (_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(angleChange)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    
    return _link;
}

- (void)awakeFromNib
{
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    CGFloat wh = self.bounds.size.width;
    //  加载大图片
    UIImage* bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *selBigImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat imageW = bigImage.size.width * scale / 12;
    CGFloat imageH = bigImage.size.height * scale;

    _centerView.userInteractionEnabled = YES;
    //  添加按钮
    for (int i = 0; i < 12; i++) {
        YHPWheelButton* btn = [YHPWheelButton buttonWithType:UIButtonTypeCustom];
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(wh * 0.5, wh * 0.5);
        
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
//        btn.backgroundColor = [UIColor redColor];
        //  按钮旋转角度
        CGFloat radian = angle2Radian(BTN_ROTATION_ANGLE * i);
        btn.transform = CGAffineTransformMakeRotation(radian);
        [_centerView addSubview:btn];
        
        // 设置按钮图片
        CGRect clipR = CGRectMake(i * imageW, 0, imageW, imageH);
        // 裁剪区域
        CGImageRef imgR = CGImageCreateWithImageInRect(bigImage.CGImage, clipR);
        UIImage* image = [UIImage imageWithCGImage:imgR];
        // 设置按钮图片
        [btn setImage:image forState:UIControlStateNormal];
        // 设置按钮选中图片
        imgR = CGImageCreateWithImageInRect(selBigImage.CGImage, clipR);
        image = [UIImage imageWithCGImage:imgR];
        [btn setImage:image forState:UIControlStateSelected];
        // 设置按钮选择图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        //  监听按钮点击
        [btn addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            [self btnCLick:btn];
        }
    
    }
}

-(void)btnCLick:(UIButton*)btn
{
    _selBtn.selected = NO;
    btn.selected = YES;
    _selBtn = btn;
}

+(instancetype)wheelView
{
   return [[NSBundle mainBundle] loadNibNamed:@"YHPWheelView" owner:nil options:nil][0];
}

#pragma mark - 开点旋转
-(void)start
{
    self.link.paused = NO;
}
#pragma mark - 暂停旋转
-(void)pause
{
    self.link.paused = YES;
}
#pragma mark - 每隔一定时间旋转一定角度
-(void)angleChange
{
    // 每一次调用旋转多少
    CGFloat angle = angle2Radian(45 / 60.0);    
    _centerView.transform = CGAffineTransformRotate(_centerView.transform, angle);

}
#pragma mark - 点击开始选号
- (IBAction)startPicker:(UIButton *)sender {
    //  中间的转盘快速旋转，不需要与用户交互
    self.link.paused = YES;
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 2 * 3);
    anim.duration = 1;
    anim.delegate = self;
    [_centerView.layer addAnimation:anim forKey:nil];
    //  点击那个星座，就把当前星座指向中心点上面
   
    CGFloat angle = atan2(_selBtn.transform.b, _selBtn.transform.a);
    NSLog(@"%f",angle);
    // 旋转转盘
    _centerView.transform = CGAffineTransformMakeRotation(-angle);
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.link.paused = NO;
    });
}


@end
