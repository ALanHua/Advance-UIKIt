//
//  YHPProvince.m
//  01-键盘处理
//
//  Created by yhp on 16/3/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPProvince.h"

@implementation YHPProvince
+(instancetype)provinceWithDict:(NSDictionary*)dict
{
    YHPProvince* p = [[self alloc]init];
    [p setValuesForKeysWithDictionary:dict];
    
    return p;
}
@end
