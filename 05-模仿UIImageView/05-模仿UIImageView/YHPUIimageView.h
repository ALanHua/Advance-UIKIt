//
//  YHPUIimageView.h
//  05-模仿UIImageView
//
//  Created by yhp on 16/5/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPUIimageView : UIView

/** image */
@property(nonatomic,strong)UIImage* image;

-(instancetype)initWithImage:(UIImage*)imga;

@end
