//
//  YHPGridLayout.m
//  14-自定义布局
//
//  Created by yhp on 2017/4/6.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPGridLayout.h"

@interface YHPGridLayout ()
/** 所有布局属性 */
@property(nonatomic,strong)NSMutableArray* attrsAaaray;
@end


@implementation YHPGridLayout

- (NSMutableArray *)attrsAaaray
{
    if (!_attrsAaaray) {
        _attrsAaaray = [NSMutableArray array];
    }
    return _attrsAaaray;
}

-(void)prepareLayout
{
    [super prepareLayout];
    [self.attrsAaaray removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建UICollectionViewLayoutAttributes
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes* attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        // 设置属性
        CGFloat width  = self.collectionView.frame.size.width * 0.5;
        CGFloat height = 0;
        CGFloat x = 0;
        CGFloat y = 0;
        if (i == 0) {
            height = width;
            x = 0;
            y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i == 1){
            height = width * 0.5;
            x = width;
            y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i == 2){
            height = width * 0.5;
            x = width;
            y = height;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i == 3){
            height = width * 0.5;
            x = 0;
            y = width;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i == 4){
            height = width * 0.5;
            x = 0;
            y = width + height;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i == 5){
            height = width;
            x = width;
            y = width;
            attrs.frame = CGRectMake(x, y, width, height);
        }else{
            UICollectionViewLayoutAttributes* lastArray = self.attrsAaaray[i - 6];
            CGRect lastFrame = lastArray.frame;
            lastFrame.origin.y += 2 * width;
            attrs.frame = lastFrame;
        }
        // 添加UICollectionViewLayoutAttributes
        [self.attrsAaaray addObject:attrs];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsAaaray;
}

/**
 返回collectionView的内容大小
 @return 内存尺寸
 */
-(CGSize)collectionViewContentSize
{
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    int rows= (count + 3 - 1) /3;
    CGFloat rowH = self.collectionView.frame.size.width * 0.5;
    return CGSizeMake(0, rows * rowH);
}

@end
