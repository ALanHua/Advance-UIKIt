//
//  YHPImageHandleView.m
//  06-画板
//
//  Created by yhp on 16/5/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPImageHandleView.h"

@interface YHPImageHandleView () <UIGestureRecognizerDelegate>

/**imageView*/
@property(nonatomic,weak)UIImageView* imageV;

@end

@implementation YHPImageHandleView

- (UIImageView*)imageV
{
    if (_imageV == nil) {
        UIImageView* imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        imageV.userInteractionEnabled = YES;
        _imageV = imageV;
        // 添加手势
        [self setUpGestureRecognizer];
        [self addSubview:imageV];
    }
    return _imageV;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    //  图片展示到
    self.imageV.image = image;
}

#pragma mark - 添加手势
-(void)setUpGestureRecognizer
{
    //  平移
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [_imageV addGestureRecognizer:pan];
    //  旋转
    UIRotationGestureRecognizer* rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [_imageV addGestureRecognizer:rotation];
    //  缩放
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [_imageV addGestureRecognizer:pinch];
    //  长按
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [_imageV addGestureRecognizer:longPress];
}

// 平移手势处理函数
-(void)pan:(UIPanGestureRecognizer*)pan
{
    //  获取手指的偏移点
   CGPoint transP = [pan translationInView:self.imageV];
    //  设置UIImageView的形变
    self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, transP.x, transP.y);
    //  复位
    [pan setTranslation:CGPointZero inView:self.imageV];
}
// 旋转手势处理函数
-(void)rotation:(UIRotationGestureRecognizer*)rotation
{
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, rotation.rotation);
    //  复位
    rotation.rotation = 0;
}
// 缩放手势处理函数
-(void)pinch:(UIPinchGestureRecognizer*)pinch
{
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, pinch.scale, pinch.scale);
    
    pinch.scale = 1;
}
// 添加长按手势处理函数
-(void)longPress:(UILongPressGestureRecognizer*)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        //  图片处理完毕
        
        //  高亮
        [UIView animateWithDuration:0.25 animations:^{
            self.imageV.alpha = 0;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.25 animations:^{
                self.imageV.alpha = 1;
            } completion:^(BOOL finished) {
                /**
                 *  高亮完成时
                 *  截屏
                 */
                //开启位图上下文
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                // 获取位置上下文
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                // 渲染上下文
                [self.layer renderInContext:ctx];
                //  获取图片
                UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
                //  关闭上下文
                UIGraphicsEndImageContext();
                if (_hanleCompletionBlock) {
                    _hanleCompletionBlock(image);
                }
                if (_handleBeginBlock) {
                    _handleBeginBlock();
                }
                
                [self removeFromSuperview];
            }];
        }];
    }
}

#pragma mark - 手势代理函数
// 同时支持多个手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
