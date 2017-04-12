//
//  YHPShop.h
//  15-瀑布流
//
//  Created by yhp on 2017/4/12.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPShop : NSObject
/** 宽度 */
@property(nonatomic,assign) CGFloat w;
/** 高度 */
@property(nonatomic,assign)CGFloat h;
/** 图片 */
@property(nonatomic,copy)NSString* img;
/** 价格 */
@property(nonatomic,copy)NSString* price;

@end
