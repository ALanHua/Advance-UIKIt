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
@end

@implementation YHPWheelView

//  这个方法只是加载xib的时候会调用，但是并没有连好线
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super initWithCoder:aDecoder]){
//    }
//    return self;
//}

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
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 2);
    anim.duration = 2;
    anim.repeatCount = MAXFLOAT;
    
    [_centerView.layer addAnimation:anim forKey:nil];
}
#pragma mark - 暂停旋转
-(void)pause
{
    
}
@end
