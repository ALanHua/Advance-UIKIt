//
//  UIImage+YHPImage.m
//  06-图片裁剪
//
//  Created by yhp on 16/5/4.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "UIImage+YHPImage.h"

@implementation UIImage (YHPImage)

+(UIImage*)imageWithClipImage:(UIImage*)image border:(CGFloat)border borderWithColor:(UIColor*)color
{
    // 图片宽高一致
    CGFloat imageW = image.size.width;
    CGFloat ovalWH = imageW + 2 * border;
    //    1,开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    //    2,画大圆
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    [color set];
    [path fill];
    //    3,设置裁剪区域
    UIBezierPath* clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border,imageW,imageW)];
    [clipPath addClip];
    //    4,绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    //    5,获取图片
    UIImage* clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //    关闭上下文
    UIGraphicsEndImageContext();
    
    return clipImage;
}
@end
