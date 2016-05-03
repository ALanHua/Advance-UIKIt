//
//  YHPWindow.m
//  04-事件的产生和传递
//
//  Created by yhp on 16/4/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPWindow.h"

@implementation YHPWindow

// 时间传递的时候调用
// 什么时候调用，当事件传递控件的时候，就会调用控件的这个方法
// 默认做法：寻找最合适的view
// point: 当前的触摸点，这个点的坐标系就是方法调用者
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    //
//    NSLog(@"%s",__func__);
//    //  调用系统做法去寻找最合适的view
//    return [super hitTest:point withEvent:event];
//}

//作用：判断当前这个点在不在方法调用者上
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    
    return YES;
}

@end
