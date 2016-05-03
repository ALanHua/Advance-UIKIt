//
//  YHPContact.h
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPContact : NSObject

/** 姓名 */
@property(nonatomic,strong)NSString* name;
/** 电话 */
@property(nonatomic,strong)NSString* phone;

+(instancetype)contactWithName:(NSString*)name phone:(NSString*)phone;

@end
