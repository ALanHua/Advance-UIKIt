//
//  YHPAddViewController.h
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHPAddViewController,YHPContact;

@protocol  YHPAddViewControllerDelegate<NSObject>

@optional
-(void)addViewController:(YHPAddViewController*)addVc
didClickAddBtnWithContact:(YHPContact*)contact;
@end

@interface YHPAddViewController : UIViewController

@property(nonatomic,weak)id<YHPAddViewControllerDelegate> delegate;

@end
