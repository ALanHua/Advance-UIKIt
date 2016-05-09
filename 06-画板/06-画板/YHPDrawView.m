//
//  YHPDrawView.m
//  06-画板
//
//  Created by yhp on 16/5/9.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDrawView.h"

@interface YHPDrawView ()
/** 贝塞尔曲线 */
@property(nonatomic,strong)UIBezierPath* path;
@property(nonatomic,strong)NSMutableArray* paths;

@end

@implementation YHPDrawView

-(NSMutableArray*)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    
    return _paths;
}

#pragma mark - 仅仅加载xib的时候调用
-(void)awakeFromNib
{
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

#pragma mark - 初始化
-(void)setUp
{
//    添加pan手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    
}

// 手指拖动的时候
-(void)pan:(UIPanGestureRecognizer*)pan
{
    CGPoint curP = [pan locationInView:self];
    //  获取开始点
    if (pan.state == UIGestureRecognizerStateBegan) {
        //  创建贝塞尔路径
         _path = [UIBezierPath bezierPath];
        //  设置路径的起始点
        [_path moveToPoint:curP];
        //  保存描述好的路径
        [self.paths addObject:_path];
    } else if (pan.state == UIGestureRecognizerStateEnded){
        
    }
    //  手指在其他位置
    [_path addLineToPoint:curP];
    //  重绘
    [self setNeedsDisplay];
}

#pragma mark - 绘制图形
- (void)drawRect:(CGRect)rect
{
    for (UIBezierPath* path in self.paths) {
        [path stroke];
    }
}

@end
