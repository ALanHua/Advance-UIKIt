//
//  YHPMenuItemButton.m
//  09-微博动画
//
//  Created by yhp on 16/5/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPMenuItemButton.h"
#define kImageRatio  0.8

@implementation YHPMenuItemButton


-(void)awakeFromNib
{
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

-(void)setUp
{
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}
// 代码设置控件位置，一般在该方法中重写
- (void)layoutSubviews
{
    [super layoutSubviews];
    //   UIImageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * kImageRatio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    //   UILabel
    CGFloat labelX = imageX;
    CGFloat labelY = imageH;
    CGFloat labelW = imageW;
    CGFloat labelH = self.bounds.size.height - imageH;
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

@end
