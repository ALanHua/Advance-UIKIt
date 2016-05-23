//
//  YHPMenuItemButton.m
//  09-微博动画
//
//  Created by yhp on 16/5/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPMenuItemButton.h"
#define kImageRatio  0.8

@implementation YHPMenuItemButton

// 修改按钮内部的布局
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    
//}
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    
//}
// 代码设置控件位置，一般在该方法中重写
- (void)layoutSubviews
{
    [super layoutSubviews];
    //   UIImageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * kImageRatio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    //   UILabel
    CGFloat labelX = imageX;
    CGFloat labelY = imageH;
    CGFloat labelW = imageW;
    CGFloat labelH = self.bounds.size.height - imageH;
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

@end
