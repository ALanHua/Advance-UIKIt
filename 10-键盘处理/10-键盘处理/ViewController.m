//
//  ViewController.m
//  10-键盘处理
//
//  Created by yhp on 16/9/18.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPKeyboardTool.h"

@interface ViewController () <UITextFieldDelegate,YHPKeyboardToolDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameFeild;
@property (weak, nonatomic) IBOutlet UITextField *emailFeild;
@property (weak, nonatomic) IBOutlet UITextField *addressFeild;
@property(nonatomic,strong)NSArray* fields;
@property(nonatomic,weak)YHPKeyboardTool* toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.fields = @[self.nameFeild,self.emailFeild,self.addressFeild];
    // 加载工具条控件
    YHPKeyboardTool* toolbar = [YHPKeyboardTool tool];
    toolbar.toolbardelegate = self;
    self.toolbar = toolbar;
    // 设置工具条
    self.nameFeild.inputAccessoryView = toolbar;
    self.emailFeild.inputAccessoryView = toolbar;
    self.addressFeild.inputAccessoryView = toolbar;

}
-(void)testInputViewAndInputAccessoryView
{
    // 更换键盘
    UIView* keyboard = [[UIView alloc]init];
    keyboard.frame = CGRectMake(0, 0, 0, 100);
    keyboard.backgroundColor = [UIColor redColor];
    self.emailFeild.inputView = keyboard;
    
    //  设置键盘顶部工具条
    UIView* toolbar = [[UIView alloc]init];
    toolbar.frame = CGRectMake(0, 0, 0, 44);
    toolbar.backgroundColor = [UIColor greenColor];
    self.nameFeild.inputAccessoryView = toolbar;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - <UITextFieldDelegate>
/**
 *  当点击键盘右下角的ReturnKey就会调用这个方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameFeild) {
        // 让emailFeild成为第一响应者
        [self.emailFeild becomeFirstResponder];
    }else if ( textField == self.emailFeild){
        // 让addressFeild成为第一响应者
        [self.addressFeild becomeFirstResponder];
    }else if (textField == self.addressFeild){
        [self.view endEditing:YES];
//        [textField resignFirstResponder];
    }
    
    return YES;
}
/**
 *  监听键盘弹出
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSInteger currentIndex = [self.fields indexOfObject:textField];
    self.toolbar.previousItem.enabled =  (currentIndex != 0);
    self.toolbar.nextItem.enabled  =  (currentIndex != self.fields.count - 1);;
}

#pragma mark - <YHPKeyboardToolDelegate>
- (void)keyboardTool:(YHPKeyboardTool *)tool didClickItem:(YHPKeyboardToolItem)item
{
    if (item == YHPKeyboardToolItemPrevious) {
        NSInteger currentIndex = 0;
        for (UIView* view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex--;
        [self.fields[currentIndex] becomeFirstResponder];
        self.toolbar.previousItem.enabled =  (currentIndex != 0);
        self.toolbar.nextItem.enabled  =  YES;
    }else if (item == YHPKeyboardToolItemNext){
        NSInteger currentIndex = 0;
        for (UIView* view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex++;
        [self.fields[currentIndex] becomeFirstResponder];
        self.toolbar.previousItem.enabled = YES;
        self.toolbar.nextItem.enabled  = (currentIndex != self.fields.count - 1);
    }else if (item == YHPKeyboardToolItemDone){
      [self.view endEditing:YES];
    }
}



@end
