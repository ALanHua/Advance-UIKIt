//
//  YHPLockView.m
//  06-手势识别
//
//  Created by yhp on 16/5/6.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPLockView.h"

@interface YHPLockView ()
/**  */
@property(nonatomic,strong)NSMutableArray* selectedBtn;
/**  */
@property(nonatomic,assign)CGPoint curP;
@end

@implementation YHPLockView

-(NSMutableArray*)selectedBtn
{
    if (_selectedBtn == nil) {
        _selectedBtn = [NSMutableArray array];
    }
    
    return _selectedBtn;
}



-(IBAction)pan:(UIPanGestureRecognizer*)pan
{
//  获取触摸点
     _curP = [pan locationInView:self];
//  判断点是否在按钮上
    for (UIButton* btn in self.subviews) {
        // 判断点在不在一个矩形范围类
        if( CGRectContainsPoint(btn.frame, _curP)
        && btn.selected == NO){
            //  点在按钮上
            btn.selected = YES;
            //  保存数组中
            [self.selectedBtn addObject:btn];
        }
    }
    //  重绘
    [self setNeedsDisplay];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
//        创建可变字符串
        NSMutableString* strM = [NSMutableString string];
//       保存输入密码
        for (UIButton* btn in self.selectedBtn) {
            [strM appendFormat:@"%ld",btn.tag];
        }
        NSLog(@"%@",strM);
        
        // 还原界面
//       [self.selectedBtn makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];// 该方法好像不起作用
        for (UIButton* btn in self.selectedBtn) {
            btn.selected = NO;
        }
        [self.selectedBtn removeAllObjects];
        //  重绘
//        [self setNeedsDisplay];
    }
}

// 加载完xib的时候调用
- (void)awakeFromNib
{
    // 创建9个按钮
    for ( int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 不允许用户交互，按钮不能点击，也就是不能高亮
        btn.userInteractionEnabled = NO;
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        btn.tag = i;
        
        [self addSubview:btn];
    }
}


// 为什么要在这个方法布局子控件，因为只要一调用这个方法，就表示父控件的尺寸确定
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    int cols = 3;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 74;
    CGFloat h = 74;
    CGFloat margin = (self.bounds.size.width - cols * w) / (cols + 1);
    
    CGFloat col = 0;
    CGFloat row = 0;
    for (NSUInteger i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        // 获取当前按钮的列数
        col = i % cols;
        row = i / cols;
        x = margin + col * (margin + w);
        y = row * (margin + w);
        
        btn.frame = CGRectMake(x, y, w, h);
        
    }
    
}
#pragma mark - 绘图连线
- (void)drawRect:(CGRect)rect
{
    
    if (self.selectedBtn.count == 0) {
        return;
    }
//    所有按钮中心点连线
    UIBezierPath* path = [UIBezierPath bezierPath];
    NSInteger count = self.selectedBtn.count;
    for (int i = 0; i < count; i++) {
        UIButton* btn = self.selectedBtn[i];
        if (i == 0) {
           //    设置起点
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
//   连线到手指的触摸点
    [path addLineToPoint:_curP];
    path.lineJoinStyle = kCGLineJoinRound;
//    渲染
    [[UIColor greenColor]set];
    path.lineWidth = 5;
    [path stroke];
    
}

@end
