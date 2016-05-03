//
//  YHPFlag.h
//  01-国旗选择
//
//  Created by yhp on 16/3/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPFlag : NSObject

/** name */
@property(nonatomic,strong)NSString* name;
/** icon */
@property(nonatomic,strong)NSString* icon;

//instancetype 自动识别类型
//为什么不用id，id不能使用点语法
//id 可以调用任何对象的方法，不利于编译器检查错误
+(instancetype)flagWithDict:(NSDictionary*)dict;

@end
