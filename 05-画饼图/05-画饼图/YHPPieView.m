//
//  YHPPieView.m
//  05-画饼图
//
//  Created by yhp on 16/5/2.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPPieView.h"

@implementation YHPPieView

- (NSArray*)arrRandom
{
    int total = 100;
    NSMutableArray* arrM = [NSMutableArray array];
    int temp = 0;
    for (int i = 0; i < arc4random_uniform(10) + 1; i++) {
        temp = arc4random_uniform(total) + 1;
        [arrM addObject:@(temp)];
        
        if (temp == total) {
            break;
        }
        
        total -= temp;
    }
    if (total) {
        [arrM addObject:@(total)];
    }
    
    return arrM;
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    NSArray* arr = [self arrRandom];
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (int i = 0; i < arr.count; i++) {
        startA = endA;
        angle = [arr[i] integerValue] / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self colorRandom]set];
        
        [path fill];
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

- (UIColor*)colorRandom
{
    // RGB,0 --255
    // OC -- 0-1
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

-(void)draw {
    
    
    CGFloat radius = self.bounds.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    //  第一扇形
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    //  添加一根线到圆心
    [path addLineToPoint:center];
    [[UIColor redColor]set];
    
    [path fill];
    
    
}
@end
