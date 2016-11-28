//
//  YHPStatusBarHUD.h
//  11-YHPStatusBarHUD
//
//  Created by yhp on 2016/11/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPStatusBarHUD : NSObject


/**
 显示普通信息
 @param msg 信息内容
 */
+(void)showMessage:(NSString*)msg;

/**
  显示普通信息
 @param msg  信息内容
 @param image 图片
 */
+(void)showMessage:(NSString*)msg image:(UIImage*)image;
/**
 显示成功信息
 @param msg 信息内容
 */
+(void)showSuccess:(NSString*)msg;
/**
 显示失败信息
 @param msg 信息内容
 */
+(void)showError:(NSString*)msg;
/**
 显示正在加载信息
 @param msg 信息内容
 */
+(void)showLoading:(NSString*)msg;
/**
 隐藏
 */
+(void)hide;
@end
