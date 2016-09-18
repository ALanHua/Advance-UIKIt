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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
        
    }else if ( textField == self.emailFeild){
        
    }else if (textField == self.addressFeild){
//        [self.view endEditing:YES];
        /**
         *  第二种方法
         */
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
