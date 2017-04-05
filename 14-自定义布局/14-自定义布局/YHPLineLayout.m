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
    }
    return self;
}


/**
 布局初始化操作，不建议在init方法中做初始化操作
 */
- (void)prepareLayout
{
    [super prepareLayout];
    // 水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat insert = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset =  UIEdgeInsetsMake(0, insert, 0, insert);
}
/**
 一旦显示边框放生改变的时候，就重新布局
 * prepareLayout
 * layoutAttributesForElementsInRect
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 存放所有元素的布局属性数组
 UICollectionViewLayoutAttributes* attrs;
 1，一个 cell 对应一个UICollectionViewLayoutAttributes对象
 2，UICollectionViewLayoutAttributes决定frame
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
 这个方法返回值，就决定了collectionView停止滚动时的偏移量
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
//  寻找最小偏移量
    CGFloat miniDelta =MAXFLOAT;
    for (UICollectionViewLayoutAttributes* attrs in array) {
        if(ABS(miniDelta) > ABS(attrs.center.x - centerX)){
            miniDelta = attrs.center.x - centerX;
        }
    }
//  修改原有偏移量
    proposedContentOffset.x += miniDelta;
    return proposedContentOffset;
}

/**
 1,cell 的放大和居中
 2，停止滑动，cell居中
 */


@end
