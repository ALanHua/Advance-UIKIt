//
//  YHPEditViewController.h
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/13.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPContact;

@interface YHPEditViewController : UIViewController
/** 模型 */
@property(nonatomic,strong)YHPContact* contact;
@end
