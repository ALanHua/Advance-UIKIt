//
//  YHPDrawView.h
//  06-画板
//
//  Created by yhp on 16/5/9.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPDrawView : UIView

/** 线宽 */
@property(nonatomic,assign)NSInteger lineWidth;
/** 画板线的颜色 */
@property(nonatomic,strong)UIColor* pathColor;
/** 图片 */
@property(nonatomic,strong)UIImage* image;


/**
 *  清屏的方法
 */
-(void)clear;
-(void)unDo;


@end
