//
//  YHPWelcomeView.m
//  09-微博动画
//
//  Created by yhp on 16/5/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPWelcomeView.h"

@interface YHPWelcomeView ()
@property (weak, nonatomic) IBOutlet UIImageView *sloganView;
@property (weak, nonatomic) IBOutlet UIImageView *icomView;
@property (weak, nonatomic) IBOutlet UILabel *textView;

@end

@implementation YHPWelcomeView

+(instancetype)welcomeView
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YHPWelcomeView class]) owner:nil options:nil][0];
}

@end
