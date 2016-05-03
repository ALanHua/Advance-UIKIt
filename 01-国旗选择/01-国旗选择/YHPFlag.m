//
//  YHPFlag.m
//  01-国旗选择
//
//  Created by yhp on 16/3/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPFlag.h"

@implementation YHPFlag

+(instancetype)flagWithDict:(NSDictionary*)dict
{
    YHPFlag* flag = [[self alloc]init];
//     字典转模型
    [flag setValuesForKeysWithDictionary:dict];

    return flag;
}
// KVC

@end
