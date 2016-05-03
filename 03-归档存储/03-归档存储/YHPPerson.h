//
//  YHPPerson.h
//  03-归档存储
//
//  Created by yhp on 16/4/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>
// 如果一个自定义对象想要归档，必须遵守NSCoding协议，实现协议方法
@interface YHPPerson : NSObject<NSCoding>
/** 属性 */
@property(nonatomic,assign)int age;
@property(nonatomic,strong)NSString* name;
@end
