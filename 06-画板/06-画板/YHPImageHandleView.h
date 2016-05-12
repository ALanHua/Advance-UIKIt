//
//  YHPImageHandleView.h
//  06-画板
//
//  Created by yhp on 16/5/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPImageHandleView : UIView

/** 图片 */
@property(nonatomic,strong)UIImage* image;

/** block */
@property(nonatomic,strong)void (^hanleCompletionBlock)(UIImage* image);

@end
