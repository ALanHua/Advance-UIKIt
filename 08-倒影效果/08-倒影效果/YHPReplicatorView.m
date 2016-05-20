//
//  YHPReplicatorView.m
//  08-倒影效果
//
//  Created by yhp on 16/5/20.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPReplicatorView.h"

@implementation YHPReplicatorView

// 设置主层的类型
+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
