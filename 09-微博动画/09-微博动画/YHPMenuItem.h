//
//  YHPMenuItem.h
//  09-微博动画
//
//  Created by yhp on 16/5/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPMenuItem : NSObject

/** 标题 */
@property(nonatomic,strong)NSString* title;
/** 图片*/
@property(nonatomic,strong)UIImage* image;


+(instancetype)itemWithTitle:(NSString*)title image:(UIImage*)image;

@end
