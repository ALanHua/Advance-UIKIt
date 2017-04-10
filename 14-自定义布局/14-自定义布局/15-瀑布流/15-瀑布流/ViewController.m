//
//  ViewController.m
//  15-瀑布流
//
//  Created by yhp on 2017/4/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPWaterflowLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

static NSString* const YHPShopId = @"shop";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)setUpWaterflowLayout
{
    YHPWaterflowLayout* layout = [[YHPWaterflowLayout alloc]init];
    CGRect frame = self.view.bounds;
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
//    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:YHPShopId];
}
     
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:YHPShopId forIndexPath:indexPath];
    NSInteger tag = 10;
    UILabel* label = [(UILabel*)cell.contentView viewWithTag:tag];
    if (label == nil) {
        label = [[UILabel alloc]init];
        label.tag = tag;
        [cell.contentView addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"%zd",indexPath.item];
    [label sizeToFit];
    return cell;
    
}

@end
