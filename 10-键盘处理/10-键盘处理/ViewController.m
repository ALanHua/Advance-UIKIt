//
//  ViewController.m
//  10-键盘处理
//
//  Created by yhp on 16/9/18.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameFeild;
@property (weak, nonatomic) IBOutlet UITextField *emailFeild;
@property (weak, nonatomic) IBOutlet UITextField *addressFeild;

@end

@implementation ViewController

/**
 *  监听toobar上的按钮点击
 */
- (IBAction)previous:(UIBarButtonItem *)sender {
    
}
- (IBAction)next:(UIBarButtonItem *)sender {
    
}
- (IBAction)done:(UIBarButtonItem *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 加载工具条控件
   UIToolbar* toolbar =  [[[NSBundle mainBundle] loadNibNamed:@"YHPkeyboard" owner:self options:nil]firstObject];
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

@end
