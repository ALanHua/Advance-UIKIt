//
//  UIImage+YHPImage.h
//  06-图片裁剪
//
//  Created by yhp on 16/5/4.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YHPImage)

+(UIImage*)imageWithClipImage:(UIImage*)image border:(CGFloat)border borderWithColor:(UIColor*)color;
@end
