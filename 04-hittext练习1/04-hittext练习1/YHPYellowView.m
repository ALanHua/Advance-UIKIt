//
//  YHPYellowView.m
//  04-hittext练习1
//
//  Created by yhp on 16/4/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPYellowView.h"

@interface YHPYellowView ()

/** 按钮 */
@property(nonatomic,weak)IBOutlet UIButton* btn;
@end

@implementation YHPYellowView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //  坐标系转换
    CGPoint btnP = [self convertPoint:point toView:self.btn];
    //  判断点在不在按钮上
    if([self.btn pointInside:btnP withEvent:event]){
        return self.btn;
    }else{
        return [super hitTest:point withEvent:event];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%@",self.btn);
    NSLog(@"%s",__func__);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
