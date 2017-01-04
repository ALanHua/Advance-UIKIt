//
//  YHPLabel.m
//  13-MenuController
//
//  Created by yhp on 2017/1/4.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "YHPLabel.h"

@implementation YHPLabel

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp
{
    self.userInteractionEnabled = YES;
    
}
@end
