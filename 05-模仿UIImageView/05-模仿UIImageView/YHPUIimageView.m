//
//  YHPUIimageView.m
//  05-模仿UIImageView
//
//  Created by yhp on 16/5/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPUIimageView.h"

@implementation YHPUIimageView


-(instancetype)initWithImage:(UIImage*)imgae
{
//    默认和图片尺寸一样大
    if (self = [super initWithFrame:CGRectMake(0, 0, imgae.size.width, imgae.size.height)]) {
        _image = imgae;
    }
    return self;
}


-(void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    [_image drawInRect:rect];
}

@end
