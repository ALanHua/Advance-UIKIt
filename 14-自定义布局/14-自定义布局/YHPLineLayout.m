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
 存放所有元素的布局属性数组
 @param rect  存放所有元素的布局属性
 @return 决定rect范围布局排布
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获得super 计算好的布局属性
    NSArray* array =  [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes* attrs in array) {
        CGFloat scale = arc4random_uniform(100) / 100.0;
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    
    return array;
}

/**
 1,cell 的放大和居中
 2，停止滑动，cell居中
 */


@end
