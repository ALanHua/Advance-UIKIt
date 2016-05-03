//
//  YHPPerson.m
//  03-归档存储
//
//  Created by yhp on 16/4/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPPerson.h"

@implementation YHPPerson

// 自定义归档调用：用来描述对象那些属性需要归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // name
    [aCoder encodeObject:_name forKey:@"name"];
    // age
    [aCoder encodeInteger:_age forKey:@"age"];
}

// 那些属性需要接档
/**
 用来解析文件的
 */
// 只要解析文件的时候就会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
//    什么时候需要调用initWithCoder
    if (self = [super init]) {
//        注意一定要给成员变量赋值
        //  name
        _name = [aDecoder decodeObjectForKey:@"name"];
        //   age
        _age = [aDecoder decodeIntForKey:@"age"];
        
    }
    return self;
}

@end
