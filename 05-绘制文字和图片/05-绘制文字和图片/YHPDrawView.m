//
//  YHPDrawView.m
//  05-绘制文字和图片
//
//  Created by yhp on 16/5/2.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@implementation YHPDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //  绘制文字
    //  裁剪必须放在绘图之前
    UIRectClip(CGRectMake(0, 0, 200, 200));
    UIImage* image = [UIImage imageNamed:@"黄人"];
//    [image drawAtPoint:CGPointZero];
//    [image drawInRect:rect];
    [image drawAsPatternInRect:rect];// 平铺
    
}

- (void)attrText
{
    //  绘制文字
    NSString* str = @"youhuapei";
    //  文字的起点
    //  withAttributes,文本属性
    NSMutableDictionary* textDict = [NSMutableDictionary dictionary];
    // 设置文字颜色
    textDict[NSForegroundColorAttributeName] = [UIColor redColor];
    // 设置文字字体
    textDict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    // 设置文字空心颜色
    textDict[NSStrokeWidthAttributeName] = @5;
    textDict[NSStrokeColorAttributeName] = [UIColor yellowColor];
    // 设置阴影
    NSShadow* shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowOffset = CGSizeMake(4, 4);
    shadow.shadowBlurRadius = 3;
    
    textDict[NSShadowAttributeName] = shadow;
    
    // 该方法不会自动换行
    [str drawAtPoint:CGPointZero withAttributes:textDict];
    
}

@end
