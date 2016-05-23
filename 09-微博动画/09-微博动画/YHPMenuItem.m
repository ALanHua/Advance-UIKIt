//
//  YHPMenuItem.m
//  09-微博动画
//
//  Created by yhp on 16/5/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPMenuItem.h"

@implementation YHPMenuItem

+(instancetype)itemWithTitle:(NSString*)title image:(UIImage*)image
{
    YHPMenuItem* item = [[self alloc]init];
    item.title = title;
    item.image = image;
    
    return item;
}

@end
