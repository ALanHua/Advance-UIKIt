//
//  YHPPerson.m
//  15-Runtime_MethodSwizzle
//
//  Created by yhp on 2017/4/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPPerson.h"

@implementation YHPPerson
-(void)run
{
    NSLog(@"%s",__func__);
}
-(void)study
{
    NSLog(@"%s",__func__); 
}
@end
