//
//  YHPKeyboardTool.m
//  10-键盘处理
//
//  Created by yhp on 16/9/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPKeyboardTool.h"

@implementation YHPKeyboardTool

+(instancetype)tool
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

- (IBAction)previous:(UIBarButtonItem *)sender {
    if ([self.toolbardelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbardelegate keyboardTool:self didClickItem:YHPKeyboardToolItemPrevious];
    }
}

- (IBAction)next:(UIBarButtonItem *)sender {
    if ([self.toolbardelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbardelegate keyboardTool:self didClickItem:YHPKeyboardToolItemNext];
    }
}
- (IBAction)done:(UIBarButtonItem *)sender {
    if ([self.toolbardelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbardelegate keyboardTool:self didClickItem:YHPKeyboardToolItemDone];
    }
}

@end
