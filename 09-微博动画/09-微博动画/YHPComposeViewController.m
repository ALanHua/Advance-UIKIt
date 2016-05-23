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

@end

@implementation YHPComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加按钮
    [self setUpAllBtn];
}

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
        btn.backgroundColor = [UIColor redColor];
        //  设置按钮的图片和文字
        YHPMenuItem *item = _item[i];
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
    }
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
