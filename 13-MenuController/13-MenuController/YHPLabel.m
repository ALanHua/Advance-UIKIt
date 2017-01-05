//
//  YHPLabel.m
//  13-MenuController
//
//  Created by yhp on 2017/1/4.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPLabel.h"

@implementation YHPLabel

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp
{
    self.userInteractionEnabled = YES;
    UIGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)];
    [self addGestureRecognizer:gesture];
}


/**
 让label 有资格成为第一响应者
 @return BOOL
 */
-(BOOL)canBecomeFirstResponder
{
    return YES;
}


/**
 label 能执行那些操作 capy paste 等
 @param action 执行
 @param sender 参数
 @return BOOL
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(cut:)
    ||  action == @selector(copy:)
    ||  action == @selector(paste:)) {
        return YES;
    }
    return NO;
}

-(void)labelClick
{
    // 1,label要成为第一响应者
    [self becomeFirstResponder];
    // 2,显示MenuController
    UIMenuController* menu = [UIMenuController sharedMenuController];
    // targetRect: 以UIMenuController需要指向的矩形框
    // targetView: 以targetView左上角作为坐标原点
    [menu setTargetRect:self.bounds inView:self];
    
    [menu setMenuVisible:YES animated:YES];
    
}

@end
