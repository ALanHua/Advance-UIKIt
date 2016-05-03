//
//  YHPFlagView.h
//  01-国旗选择
//
//  Created by yhp on 16/3/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHPFlag;

@interface YHPFlagView : UIView

/** 模型*/
@property(nonatomic,strong)YHPFlag* flag;

+(instancetype)flagView;
+(instancetype)flagViewWithFlag:(YHPFlag*)flag;

@end
