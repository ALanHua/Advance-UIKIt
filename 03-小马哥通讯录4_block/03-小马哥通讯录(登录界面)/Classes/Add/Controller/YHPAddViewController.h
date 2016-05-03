//
//  YHPAddViewController.h
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHPContact;

// 利用block传值，需要把什么传递出去，就作为bblock参数，通常不需要返回值

typedef void(^YHPAddViewControllerBlock)(YHPContact* contact);

@interface YHPAddViewController : UIViewController

/** 小弟 */
@property(nonatomic,strong)YHPAddViewControllerBlock blcok;

@end
