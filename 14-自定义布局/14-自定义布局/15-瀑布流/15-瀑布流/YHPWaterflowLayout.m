//
//  YHPWaterflowLayout.m
//  15-瀑布流
//
//  Created by yhp on 2017/4/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPWaterflowLayout.h"

@interface YHPWaterflowLayout()
/** 所有布局属性 */
@property(nonatomic,strong)NSMutableArray* attrsArray;
@end

@implementation YHPWaterflowLayout

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
    attrs.frame = CGRectMake(arc4random_uniform(300), arc4random_uniform(300), arc4random_uniform(300), arc4random_uniform(300));
    
    return attrs;
}


- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, 1000);
}


@end
