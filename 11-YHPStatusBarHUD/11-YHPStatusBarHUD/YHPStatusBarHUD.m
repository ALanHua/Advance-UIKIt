//
//  YHPStatusBarHUD.m
//  11-YHPStatusBarHUD
//
//  Created by yhp on 2016/11/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPStatusBarHUD.h"

@implementation YHPStatusBarHUD

static UIWindow* window_;


/**
 显示窗口
 */
+(void)showWindow
{
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.hidden = NO;
}


+(void)showMessage:(NSString*)msg
{
    [self showMessage:msg image:nil];
}

+(void)showMessage:(NSString*)msg image:(UIImage*)image
{
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
    
}

+(void)hide
{
    window_ = nil;
}
@end
