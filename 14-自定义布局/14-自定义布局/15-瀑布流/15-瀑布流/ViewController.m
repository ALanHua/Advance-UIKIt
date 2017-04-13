//
//  ViewController.m
//  15-瀑布流
//
//  Created by yhp on 2017/4/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPWaterflowLayout.h"
#import "YHPShop.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "YHPShopCell.h"

@interface ViewController ()<UICollectionViewDataSource,YHPWaterflowLayoutDelegate>
/** 所有商品数据 */
@property(nonatomic,strong)NSMutableArray* shops;
@property(nonatomic,weak)UICollectionView* collectionView;

@end

@implementation ViewController

static NSString* const YHPShopId = @"shop";

- (NSMutableArray *)shops
{
    if (!_shops) {
        _shops = [NSMutableArray array];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpWaterflowLayout];
    [self setUpRefresh];
}

#pragma mark - 初始化
-(void)setUpRefresh
{
    // header
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewShops)];
    [self.collectionView.header beginRefreshing];
    // footer
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShops)];
    self.collectionView.footer.hidden = YES;
}

-(void)setUpWaterflowLayout
{
    YHPWaterflowLayout* layout = [[YHPWaterflowLayout alloc]init];
    layout.delegate = self;
    CGRect frame = self.view.bounds;
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YHPShopCell class]) bundle:nil] forCellWithReuseIdentifier:YHPShopId];
    self.collectionView = collectionView;
}
#pragma mark - 加载数据
-(void)loadNewShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray* shops = [YHPShop objectArrayWithFilename:@"1.plist"];
        [self.shops removeAllObjects];
        [self.shops addObjectsFromArray:shops];
        // 刷新格子
        [self.collectionView reloadData];
        [self.collectionView.header endRefreshing];
    });
    
}

-(void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray* shops = [YHPShop objectArrayWithFilename:@"1.plist"];
        [self.shops addObjectsFromArray:shops];
        // 刷新格子
        [self.collectionView reloadData];
        [self.collectionView.footer endRefreshing];
    });
    
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.footer.hidden = (self.shops.count == 0);
    return self.shops.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YHPShopCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:YHPShopId forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    
    return cell;
    
}

#pragma mark -<YHPWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(YHPWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    YHPShop* shop = self.shops[index];
    return itemWidth * shop.h / shop.w;
}

- (CGFloat)rowMarginInWaterFlowLayout:(YHPWaterflowLayout *)waterflowLayout
{
    return 10;
}

- (UIEdgeInsets)edgeInsertInWaterFlowLayout:(YHPWaterflowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(10, 20, 10, 20);
}


@end
