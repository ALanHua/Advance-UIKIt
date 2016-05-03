//
//  YHPContact.m
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPContact.h"

@implementation YHPContact

+(instancetype)contactWithName:(NSString*)name phone:(NSString*)phone
{
    YHPContact* c = [[self alloc]init];
    c.name  = name;
    c.phone = phone;
    return c;
}
@end
