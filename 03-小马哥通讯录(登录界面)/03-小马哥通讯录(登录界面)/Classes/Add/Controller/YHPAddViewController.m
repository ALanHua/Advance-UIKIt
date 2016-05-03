//
//  YHPAddViewController.m
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/11.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPAddViewController.h"
#import "YHPContact.h"
#import "YHPContactViewController.h"

@interface YHPAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation YHPAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];

}

-(void)textChange
{
    self.addBtn.enabled = self.nameField.text.length && self.phoneField.text.length;
}
- (IBAction)add:(UIButton *)sender {
    // 0, 把文本框的值包装成模型
    YHPContact* c = [YHPContact contactWithName:self.nameField.text phone:self.phoneField.text];
    // 1,把姓名和电话传递给联系人控制器
    self.contactVc.contact = c;
    // 2,回到联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -- 光标移到姓名文本框
- (void)viewDidAppear:(BOOL)animated
{
    //    主动掏出姓名的文本框
    [self.nameField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
