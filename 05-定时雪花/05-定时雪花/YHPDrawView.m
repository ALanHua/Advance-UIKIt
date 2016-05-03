//
//  YHPDrawView.m
//  05-定时雪花
//
//  Created by yhp on 16/5/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@implementation YHPDrawView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage* image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointZero];
}

@end
