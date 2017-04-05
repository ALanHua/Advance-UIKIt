//
//  ViewController.m
//  14-自定义布局
//
//  Created by yhp on 2017/3/30.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#include "YHPLineLayout.h"
#import "YHPPhotoCell.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

static NSString* const YHPPhotoId = @"photo";

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建布局
    YHPLineLayout* layout = [[YHPLineLayout alloc]init];
    layout.itemSize = CGSizeMake(100,100);
    CGFloat collectionW  = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 注册系统自带的cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YHPPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:YHPPhotoId];
    
    
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YHPPhotoCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:YHPPhotoId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zd",indexPath.item+1];
//    cell.backgroundColor = [UIColor orangeColor];
//    NSInteger tag = 10;
//    UILabel* label = (UILabel*)[cell.contentView viewWithTag:tag];
//    if (label == nil) {
//        UILabel* label = [[UILabel alloc]init];
//        label.tag = tag;
//        [cell.contentView addSubview:label];
//    }
//    label.text = [NSString stringWithFormat:@"%zd",indexPath.row];
//    [label sizeToFit];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
