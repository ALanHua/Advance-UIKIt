//
//  YHPComposeViewController.m
//  09-微博动画
//
//  Created by yhp on 16/5/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPComposeViewController.h"
#import "YHPMenuItem.h"
#import "YHPMenuItemButton.h"
@interface YHPComposeViewController ()
@property(nonatomic,strong)NSMutableArray* itenButtons;
@property(nonatomic,assign)int btnIndex;
@property(nonatomic,strong)NSTimer* timer;
@end
/**
 按钮按顺序从下往上偏移
 */
@implementation YHPComposeViewController

-(NSMutableArray*)itemButtons
{
    if (_itenButtons == nil) {
        _itenButtons = [NSMutableArray array];
    }
    return _itenButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加按钮
    [self setUpAllBtn];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

#pragma mark -定时器
-(void)timeChange
{
    if (_btnIndex == self.itenButtons.count) {
        [_timer invalidate];
        return;
    }
    UIButton* btn = self.itenButtons[_btnIndex++];
    [self setUpOneBtnAnim:btn];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    // 做按钮的动画
//    [self setUpAllBtnAnim];
//}
#pragma mark -给按钮添加动画
-(void)setUpOneBtnAnim:(UIButton*)btn
{
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        btn.transform = CGAffineTransformIdentity;
    } completion:nil];
}

-(void)setUpAllBtnAnim
{
    for (YHPMenuItemButton* btn in self.itenButtons) {
        [self setUpOneBtnAnim:btn];
    }
}



#pragma mark -添加按钮到父控件
-(void)setUpAllBtn {
    int cols = 3;
    int col = 0;
    int row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = 100;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - 3 * wh) / (cols + 1);
    CGFloat oriY = 300;
    NSUInteger count = _item.count;
    for (int i = 0; i < count; i++) {
        YHPMenuItemButton* btn = [YHPMenuItemButton buttonWithType:UIButtonTypeCustom];
        col = i % cols;
        row = i /cols;
        x = margin + col * (margin + wh);
        y = row * (margin + wh) + oriY;
        
        btn.frame = CGRectMake(x, y, wh, wh);
//        btn.backgroundColor = [UIColor redColor];
        //  设置按钮的图片和文字
        YHPMenuItem *item = _item[i];
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        // 偏移到底部
        btn.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.itemButtons addObject:btn];
        
        [self.view addSubview:btn];
    }
}

-(void)btnClick:(UIButton*)btn
{
    [UIView animateWithDuration:0.5 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

-(void)btnClick1:(UIButton*)btn
{
    btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    btn.alpha = 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
