//
//  YHPDrawView.m
//  05-定时器雪花
//
//  Created by yhp on 16/5/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

static CGFloat _snowY = 0;

@implementation YHPDrawView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//
    UIImage* image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointMake(50, _snowY)];
    _snowY += 10;
    if (_snowY > rect.size.height) {
        _snowY = 0;
    }
    
}

// 会图时需要用定时器，通常
//NSTimer很少用于绘图，因为调度优先级比较低，并不会准时调用
-(void)awakeFromNib
{
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    CADisplayLink* link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];// 1s 中刷新 60 次（屏幕刷新）
//    添加到主运行循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)timeChange
{
//   给当前控件添加屏幕刷新标记，等下一次屏幕刷新会调用
    [self setNeedsDisplay];
}
@end
