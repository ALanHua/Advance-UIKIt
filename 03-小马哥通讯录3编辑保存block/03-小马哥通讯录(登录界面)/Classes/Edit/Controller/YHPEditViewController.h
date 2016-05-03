//
//  YHPEditViewController.h
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/13.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPContact;
// 定义block类型别名
typedef void(^YHPEditViewControllerBlock)();

@interface YHPEditViewController : UIViewController
/** 模型 */
@property(nonatomic,strong)YHPContact* contact;
/** block小弟 */
@property(nonatomic,strong)YHPEditViewControllerBlock block;

@end
