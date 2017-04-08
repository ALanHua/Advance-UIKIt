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
#import "YHPGridLayout.h"
#import "YHPCircleLayout.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
/** UIcollectionView */
@property(nonatomic,strong)UICollectionView* collectionView;
/** 数据 */
@property(nonatomic,strong)NSMutableArray* imageName;
@end

@implementation ViewController

static NSString* const YHPPhotoId = @"photo";


- (NSMutableArray *)imageName
{
    if(!_imageName){
        _imageName = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
           [_imageName addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
    }
    return _imageName;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpCircleLayout];
}

-(void)setUpCircleLayout
{
    // 创建布局
    YHPCircleLayout* layout = [[YHPCircleLayout alloc]init];
    CGFloat collectionW  = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    // 注册系统自带的cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YHPPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:YHPPhotoId];
    
}

-(void)setUpGridLayout
{
    // 创建布局
    YHPGridLayout* layout = [[YHPGridLayout alloc]init];
    CGRect frame = self.view.bounds;
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 注册系统自带的cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YHPPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:YHPPhotoId];
    
}

-(void)setUpLineLayout
{
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

/**
 切换布局
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[YHPLineLayout class]]) {
        YHPCircleLayout* layout = [[YHPCircleLayout alloc]init];
        [self.collectionView setCollectionViewLayout:layout animated:YES];
    }else{
        YHPLineLayout* layout = [[YHPLineLayout alloc]init];
        layout.itemSize = CGSizeMake(100,100);
        [self.collectionView setCollectionViewLayout:layout animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageName.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YHPPhotoCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:YHPPhotoId forIndexPath:indexPath];
    cell.imageName = self.imageName[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.imageName removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

@end
