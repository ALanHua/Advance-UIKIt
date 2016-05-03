//
//  YHPBaseView.m
//  04-事件的产生和传递
//
//  Created by yhp on 16/4/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPBaseView.h"

@implementation YHPBaseView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",[self class]);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
