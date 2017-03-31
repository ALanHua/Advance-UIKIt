//
//  YHPLineLayout.m
//  14-自定义布局
//
//  Created by yhp on 2017/3/30.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPLineLayout.h"

@implementation YHPLineLayout


- (instancetype)init
{
    if (self = [super init]) {
        /*
         UICollectionViewLayoutAttributes* attrs;
         1，一个 cell 对应一个UICollectionViewLayoutAttributes对象
         2，UICollectionViewLayoutAttributes决定frame
         */
    }
    return self;
}


/**
 一旦显示边框放生改变的时候，就重新布局 
 * layoutAttributesForElementsInRect
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 存放所有元素的布局属性数组
 @param rect  存放所有元素的布局属性
 @return 决定rect范围布局排布
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获得super 计算好的布局属性
    NSArray* array =  [super layoutAttributesForElementsInRect:rect];
    // 计算collectionView最中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes* attrs in array) {
        // cell 的中心点与collectionView中心点的间距
        CGFloat delta = ABS(attrs.center.x - centerX);
        CGFloat scale = 1- delta / self.collectionView.frame.size.width;
        // 设置缩放比例
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    
    return array;
}

/**
 1,cell 的放大和居中
 2，停止滑动，cell居中
 */


@end
