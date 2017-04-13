//
//  YHPWaterflowLayout.h
//  15-瀑布流
//
//  Created by yhp on 2017/4/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHPWaterflowLayout;

@protocol YHPWaterflowLayoutDelegate <NSObject>
@required
- (CGFloat)waterflowLayout :(YHPWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;
@optional
-(NSInteger)columnCountInWaterFlowLayout:(YHPWaterflowLayout*)waterflowLayout;
-(CGFloat)columnMarginInWaterFlowLayout:(YHPWaterflowLayout*)waterflowLayout;
-(CGFloat)rowMarginInWaterFlowLayout:(YHPWaterflowLayout*)waterflowLayout;
-(UIEdgeInsets)edgeInsertInWaterFlowLayout:(YHPWaterflowLayout*)waterflowLayout;
@end

@interface YHPWaterflowLayout : UICollectionViewLayout
/*代理*/
@property(nonatomic,weak)id<YHPWaterflowLayoutDelegate> delegate;
@end
