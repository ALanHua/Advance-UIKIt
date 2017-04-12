//
//  YHPWaterflowLayout.m
//  15-瀑布流
//
//  Created by yhp on 2017/4/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPWaterflowLayout.h"

static const NSInteger YHPDefaultColumnCount = 3;
static const CGFloat YHPDefaultColumnMargin = 10;
static const CGFloat YHPDefaultRowMargin = 10;
static const UIEdgeInsets YHPDefaultEdgeInserts = {10,10,10,10};

@interface YHPWaterflowLayout()
/** 所有布局属性 */
@property(nonatomic,strong)NSMutableArray* attrsArray;
/** 所有列的最大值 */
@property(nonatomic,strong)NSMutableArray* columnHeights;
@end

@implementation YHPWaterflowLayout

#pragma mark - 懒加载
-(NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

/**
 初始化
 */
-(void)prepareLayout
{
    [super prepareLayout];
    
    [self.columnHeights removeAllObjects];
    
    for (NSInteger i = 0; i < YHPDefaultColumnCount; i++) {
        NSNumber *number = @(YHPDefaultEdgeInserts.top);
        [self.columnHeights addObject:number];
    }
    // 清除之前的布局属性
    [self.attrsArray removeAllObjects];
    // 开始布局每一个cell的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置对应的cell的布局属性
        UICollectionViewLayoutAttributes* attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/**
 决定cell的布局
 @param rect 矩形区域
 @return 布局属性
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 返回indexPath位置cell对应的布局属性
 */
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
   
    // collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    CGFloat w = (collectionViewW - YHPDefaultEdgeInserts.left - YHPDefaultEdgeInserts.right -(YHPDefaultColumnCount - 1)*YHPDefaultColumnMargin) / YHPDefaultColumnCount;
    CGFloat h = 50 + arc4random_uniform(100);
    // 找出高度最小的那一列
//    __block NSUInteger destColumn = 0;
//    __block CGFloat minColumnHeight = MAXFLOAT;
//    [self.columnHeight enumerateObjectsUsingBlock:^(NSNumber* columnHeightNumber, NSUInteger idx, BOOL * _Nonnull stop) {
//        CGFloat columnHeight = columnHeightNumber.doubleValue;
//        if (columnHeight < minColumnHeight) {
//            minColumnHeight = columnHeight;
//            destColumn = idx;
//        }
//    }];
    NSUInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < YHPDefaultColumnCount; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat x = YHPDefaultEdgeInserts.left + destColumn * (w + YHPDefaultColumnMargin);
    CGFloat y = minColumnHeight + YHPDefaultRowMargin;
    attrs.frame = CGRectMake(x,y,w,h);
    if (y != YHPDefaultEdgeInserts.top) {
        y += YHPDefaultRowMargin;
    }
    // 更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
//    NSLog(@"%@",self.columnHeights);
    return attrs;
}


- (CGSize)collectionViewContentSize
{
    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];;
    for (NSInteger i = 1; i < YHPDefaultColumnCount; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (maxColumnHeight < columnHeight) {
            maxColumnHeight = columnHeight;
        }
    }
    return CGSizeMake(0, maxColumnHeight + YHPDefaultEdgeInserts.bottom);
}


@end
