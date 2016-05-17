//
//  YHPWheelButton.m
//  07-转盘
//
//  Created by yhp on 16/5/17.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPWheelButton.h"

@implementation YHPWheelButton


// 设置UIImageView的尺寸
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 40;
    CGFloat imageH = 46;
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    CGFloat imageY = 20;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 取消高亮状态
- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
