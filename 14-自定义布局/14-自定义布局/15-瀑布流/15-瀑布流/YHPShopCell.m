//
//  YHPShopCell.m
//  15-瀑布流
//
//  Created by yhp on 2017/4/12.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPShopCell.h"
#import "YHPShop.h"
#import "UIImageView+WebCache.h"

@interface YHPShopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation YHPShopCell

 - (void)setShop:(YHPShop *)shop
{
    _shop = shop;
    // 设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    self.priceLabel.text = shop.price;
}

@end
