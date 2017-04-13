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
/** 内容高度 */
@property(nonatomic,assign)CGFloat containHeight;

/** 方法声明*/
-(CGFloat)rowMargin;
-(CGFloat)columnMargin;
-(NSInteger)columnCount;
-(UIEdgeInsets)edgeInsert;
@end

@implementation YHPWaterflowLayout

#pragma mark - 常见数据处理
-(CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterFlowLayout:)]) {
       return  [self.delegate rowMarginInWaterFlowLayout:self];
    }
    return YHPDefaultRowMargin;
}

-(CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterFlowLayout:)]) {
        return  [self.delegate columnMarginInWaterFlowLayout:self];
    }
    return YHPDefaultColumnMargin;
}
-(NSInteger)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnCountInWaterFlowLayout:)]) {
        return  [self.delegate columnCountInWaterFlowLayout:self];
    }
    return YHPDefaultColumnCount;
}

-(UIEdgeInsets)edgeInsert
{
    if ([self.delegate respondsToSelector:@selector(edgeInsertInWaterFlowLayout:)]) {
        return  [self.delegate edgeInsertInWaterFlowLayout:self];
    }
    return YHPDefaultEdgeInserts;
}

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
    self.containHeight = 0;
    [self.columnHeights removeAllObjects];
    
    for (NSInteger i = 0; i < self.columnCount; i++) {
        NSNumber *number = @(self.edgeInsert.top);
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
    
    CGFloat w = (collectionViewW - self.edgeInsert.left - self.edgeInsert.right -(self.columnCount - 1)*self.columnMargin) / self.columnCount;
    CGFloat h = [self.delegate waterflowLayout:self heightForItemAtIndex:indexPath.item itemWidth:w];
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
    
    for (NSInteger i = 1; i < self.columnCount; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat x = self.edgeInsert.left + destColumn * (w + self.columnMargin);
    CGFloat y = minColumnHeight + self.rowMargin;
    attrs.frame = CGRectMake(x,y,w,h);
    if (y != self.edgeInsert.top) {
        y += [self rowMargin];
    }
    // 更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.containHeight < columnHeight) {
        self.containHeight = columnHeight;
    }
    
//    NSLog(@"%@",self.columnHeights);
    return attrs;
}


/**
 计算滚动范围
 @return CGSize
 */
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.containHeight + self.edgeInsert.bottom);
}


@end
