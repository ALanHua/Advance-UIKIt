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
/**
 *  文字慢慢消失
 *  显示头像，头像往上那个移动,弹簧效果
 *  欢迎回来的文字
 */
-(void)didMoveToSuperview
{
    [super didMoveToSuperview];
    //
//    _icomView.layer.cornerRadius = 50;
//    _icomView.layer.masksToBounds = YES;
    
    _icomView.transform = CGAffineTransformMakeTranslation(0, 50);
    
    [UIView animateWithDuration:0.5 animations:^{
        _sloganView.alpha = 0;
    } completion:^(BOOL finished) {
        _icomView.hidden = NO;
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _icomView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            // 欢迎回来
            _textView.alpha = 0;
            _textView.hidden = NO;
            [UIView animateWithDuration:0.5 animations:^{
                _textView.alpha = 1;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }];
        
    }];
}


@end
