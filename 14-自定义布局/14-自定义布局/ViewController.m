//
//  ViewController.m
//  14-自定义布局
//
//  Created by yhp on 2017/3/30.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#include "YHPLineLayout.h"

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

static NSString* const YHPCellId = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建布局
    YHPLineLayout* layout = [[YHPLineLayout alloc]init];
    layout.itemSize = CGSizeMake(100,100);
    // 水平滚动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat collectionW  = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    // 注册系统自带的cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YHPCellId];
    
    
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:YHPCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}


@end
