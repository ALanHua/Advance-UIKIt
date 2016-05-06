//
//  YHPVCView.m
//  06-手势识别
//
//  Created by yhp on 16/5/6.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPVCView.h"

@implementation YHPVCView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage* image = [UIImage imageNamed:@"Home_refresh_bg"];
    [image drawInRect:rect];
}

@end
