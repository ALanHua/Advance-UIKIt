//
//  YHPProvince.h
//  01-键盘处理
//
//  Created by yhp on 16/3/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPProvince : NSObject
/** 城市列表 */
@property(nonatomic,strong)NSArray* cities;
/** 城市名称 */
@property(nonatomic,strong)NSString* name;

+(instancetype)provinceWithDict:(NSDictionary*)dict;

@end
