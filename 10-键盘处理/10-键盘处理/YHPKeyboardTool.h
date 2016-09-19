//
//  YHPKeyboardTool.h
//  10-键盘处理
//
//  Created by yhp on 16/9/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    YHPKeyboardToolItemPrevious,
    YHPKeyboardToolItemNext,
    YHPKeyboardToolItemDone
}YHPKeyboardToolItem;

@class YHPKeyboardTool;

@protocol YHPKeyboardToolDelegate <NSObject>

@optional
//-(void)keyboardToolDidClickPreviousItem:(YHPKeyboardTool*)tool;
//-(void)keyboardToolDidClickNextItem:(YHPKeyboardTool*)tool;
//-(void)keyboardToolDidClickDoneItem:(YHPKeyboardTool*)tool;

-(void)keyboardTool:(YHPKeyboardTool*)tool didClickItem:(YHPKeyboardToolItem)item;

@end

@interface YHPKeyboardTool : UIToolbar

/** 代理 */
@property(nonatomic,strong) id<YHPKeyboardToolDelegate> toolbardelegate;
@property (weak, nonatomic,readonly) IBOutlet UIBarButtonItem *previousItem;
@property (weak, nonatomic,readonly) IBOutlet UIBarButtonItem *nextItem;

+(instancetype)tool;

@end
