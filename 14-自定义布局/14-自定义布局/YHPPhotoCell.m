//
//  YHPPhotoCell.m
//  14-自定义布局
//
//  Created by yhp on 2017/4/5.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPPhotoCell.h"

@interface YHPPhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YHPPhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
