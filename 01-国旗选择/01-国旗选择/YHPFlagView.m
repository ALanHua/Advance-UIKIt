 //
//  YHPFlagView.m
//  01-国旗选择
//
//  Created by yhp on 16/3/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPFlagView.h"
#import "YHPFlag.h"

@interface YHPFlagView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation YHPFlagView

+(instancetype)flagView
{
    return [self flagViewWithFlag:nil];
}
+(instancetype)flagViewWithFlag:(YHPFlag*)flag
{
    YHPFlagView* flagView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
    flagView.flag = flag;
    return flagView;
}

- (void)setFlag:(YHPFlag *)flag
{
    _flag = flag;
    self.label.text = flag.name;
    self.imageView.image = [UIImage imageNamed:flag.icon];
    
}

@end
