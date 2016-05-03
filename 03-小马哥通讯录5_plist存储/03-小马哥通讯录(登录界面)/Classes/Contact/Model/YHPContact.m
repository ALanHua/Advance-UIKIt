//
//  YHPContact.m
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPContact.h"

@implementation YHPContact

static NSString* nameKey = @"name";
static NSString* phoneKey = @"phone";

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //   name phone
    [aCoder encodeObject:_name forKey:nameKey];
    [aCoder encodeObject:_phone forKey:phoneKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:nameKey];
        _phone = [aDecoder decodeObjectForKey:phoneKey];
    }
    
    return self;
}

+(instancetype)contactWithName:(NSString*)name phone:(NSString*)phone
{
    YHPContact* c = [[self alloc]init];
    c.name  = name;
    c.phone = phone;
    return c;
}
@end
