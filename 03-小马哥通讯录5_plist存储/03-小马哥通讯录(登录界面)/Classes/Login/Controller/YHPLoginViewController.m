//
//  YHPLoginViewController.m
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPLoginViewController.h"
#import "MBProgressHUD+XMG.h"

@interface YHPLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end
#define YHPUserDefaults [NSUserDefaults standardUserDefaults]

@implementation YHPLoginViewController
/**
 *  来源控制器传递给目的控制器---顺传
 *  数据传值
 1，接收方一定要有数据接收
 2，传递方必须要拿到传递方
 */
/**
 1,performSegueWithIdentifier
 2,创建了segue
 3,设置来源控制器segue.sourceViewController = self
 4,创建目的控制器segue.destinationViewController = 目的控制器
 5,[self prepareForSegue]来源控制器执行跳转之前
 6,segue执行[segue perform]
 7,判断一下segue的类型，如果是push,拿到导航控制器push
    [self.navigationController pushViewController:segue.destinationViewController animated:YES];
 */
static NSString* accountKey = @"account";
static NSString* pwdKey = @"pwd";
static NSString* rmbKey = @"rmb";
static NSString* loginKey = @"login";

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSLog(@"%@--%@",segue.sourceViewController,segue.destinationViewController);
    UIViewController* vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人列表",self.accountField.text];

}

// 点击了登录按钮的时候调用
- (IBAction)login:(UIButton *)sender {
//    提示正在登录
    [MBProgressHUD showMessage:@"正在登录..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        影藏蒙版
        [MBProgressHUD hideHUD];
        //   验证账号和密码是否正确
        if ([self.accountField.text isEqualToString:@"123"]
            && [self.pwdField.text isEqualToString:@"123"]) {
            //    存储数据
            [YHPUserDefaults setObject:_accountField.text forKey:accountKey];
            [YHPUserDefaults setObject:_pwdField.text forKey:pwdKey];
            [YHPUserDefaults setBool:_rmbPwdSwitch.on forKey:rmbKey];
            [YHPUserDefaults setBool:_autoLoginSwitch.on forKey:loginKey];
            //    跳转到联系人界面
            [self performSegueWithIdentifier:@"loginToContact" sender:nil];
        }else{
            //    提示用户账号密码错误
            [MBProgressHUD showError:@"用户账号或密码错误"];
        }
    });
    

}

// 开关状态改变时调用
- (IBAction)rmdPwdChange:(UISwitch *)sender {
//    如果取消记住密码，自动登录也需要取消勾选
    if (self.rmbPwdSwitch.on == NO) {
//        self.autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLoginChange:(UISwitch *)sender {
//    如果勾选了自动登录，记住密码也要勾选
    if (self.autoLoginSwitch.on == YES) {
//        self.rmbPwdSwitch.on = YES;
        [self.self.rmbPwdSwitch setOn:YES animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    监听文本框内容
//    self.accountField.delegate = self;
//    给文本框添加监听器,及时监听文本框内容的改变
    //  读取数据
    NSString* account = [YHPUserDefaults objectForKey:accountKey];
    NSString* pwd = [YHPUserDefaults objectForKey:pwdKey];
    BOOL rmb = [YHPUserDefaults boolForKey:rmbKey];
    BOOL login = [YHPUserDefaults boolForKey:loginKey];
    
    self.accountField.text = account;
    if (rmb == YES) {
        self.pwdField.text = pwd;
    }
    self.rmbPwdSwitch.on = rmb;
    self.autoLoginSwitch.on = login;
    //  当勾选了自动登录
    if (_autoLoginSwitch.on) {
        [self login:nil];
    }
    
    
    [self.accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
//    判断登录按钮能否点击
    [self textChange];
}

// 当两个文本框的内容改变都会调用
-(void)textChange
{
//    NSLog(@"%@",self.accountField.text);
    self.loginBtn.enabled = self.accountField.text.length && self.pwdField.text.length;
    
}
// 当用户输入时候调用，判断用户是否允许输入
//  及时判断文本框有没有内容
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@",self.accountField.text);
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
