//
//  ViewController.m
//  08-58同城引导页
//
//  Created by yhp on 16/5/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#define angle2Radian(angle)  ((angle) / 180.0 * M_PI)

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *personView;
@property (weak, nonatomic) IBOutlet UIImageView *sunView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView* scorlView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    UIImage* bgImage = [UIImage imageNamed:@"520_userguid_bg"];
    scorlView.contentSize = bgImage.size;
    scorlView.delegate = self;
    scorlView.decelerationRate = 0.5;
    [self.view insertSubview:scorlView atIndex:0];
    //  bg
    UIImageView* bg = [[UIImageView alloc]initWithImage:bgImage];
    CGRect rect = bg.frame;
    rect.size.height = self.view.bounds.size.height;
    bg.frame = rect;
    
    
    [scorlView addSubview:bg];
    
    
}

#pragma mark -监听滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //  获取偏移量
    int offsetX = (int)scrollView.contentOffset.x;
    NSString* imageName = [NSString stringWithFormat:@"520_userguid_person_ditou_%d",(offsetX % 2 + 1)];
    UIImage *image = [UIImage imageNamed:imageName];
    // 切换人物的图片
    _personView.image = image;
    //  旋转小太阳
    _sunView.transform = CGAffineTransformRotate(_sunView.transform, angle2Radian(5));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
