//
//  YHPStatusBarHUD.m
//  11-YHPStatusBarHUD
//
//  Created by yhp on 2016/11/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPStatusBarHUD.h"

#define YHPMessageFont [UIFont systemFontOfSize:12]
static CGFloat const YHPMessageDuration = 2.0;
static CGFloat const YHPAnimationDuration = 0.25;
@implementation YHPStatusBarHUD

static UIWindow* window_;
static NSTimer* timer_;

/**
 显示窗口
 */
+(void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:YHPAnimationDuration animations:^{
        window_.frame = frame;
    }];
}


+(void)showMessage:(NSString*)msg
{
    [self showMessage:msg image:nil];
}

+(void)showMessage:(NSString*)msg image:(UIImage*)image
{
    // 停止定时器
    [timer_ invalidate];
    [self showWindow];
    // 添加按钮
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    if (image) {// 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    button.frame = window_.frame;
    [window_ addSubview:button];
    // 定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:YHPMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+(void)showSuccess:(NSString*)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"success"]];
}

+(void)showError:(NSString*)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"error"]];
}

+(void)showLoading:(NSString*)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    // 显示窗口
    [self showWindow];
    // 添加文字
    UILabel* lable = [[UILabel alloc]init];
    lable.font = YHPMessageFont;
    lable.frame = window_.bounds;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = msg;
    lable.textColor = [UIColor whiteColor];
    [window_ addSubview:lable];
    // 添加圈圈
    UIActivityIndicatorView* indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicatorView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSAttachmentAttributeName: YHPMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    indicatorView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:indicatorView];
}

+(void)hide
{
    [UIView animateWithDuration:YHPAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
@end
