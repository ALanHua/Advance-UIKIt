//
//  ViewController.m
//  05-绘制文字和图片
//
//  Created by yhp on 16/5/2.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary* textDict = [NSMutableDictionary dictionary];
    // 设置文字颜色
    textDict[NSForegroundColorAttributeName] = [UIColor redColor];
    // 设置文字字体
    textDict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    // 设置文字空心颜色
    textDict[NSStrokeWidthAttributeName] = @5;
    textDict[NSStrokeColorAttributeName] = [UIColor yellowColor];
    // 设置阴影
    NSShadow* shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowOffset = CGSizeMake(4, 4);
    shadow.shadowBlurRadius = 3;
    
    textDict[NSShadowAttributeName] = shadow;
    NSAttributedString* strrArr = [[NSAttributedString alloc]initWithString:@"youhuapei" attributes:textDict];
    //  创建富文本属性
    _labelView.attributedText = strrArr;
    
//    [_labelView sizeToFit];//只能计算普通文本
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
