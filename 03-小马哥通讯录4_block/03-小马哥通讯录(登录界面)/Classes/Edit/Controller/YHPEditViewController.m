//
//  YHPEditViewController.m
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/13.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPEditViewController.h"
#import "YHPContact.h"

@interface YHPEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation YHPEditViewController

/**
 *  这时候赋值是不成功的，因为该属性有值时界面还没有加载
 * 控制器之间传值，一定要注意控制器的子控件没有加载，一定要在子控制器
 * 加载完成后才去给控制器赋值，一般在ViewDidLoad赋值
 */
//- (void)setContact:(YHPContact *)contact
//{
//    _contact = contact;
//    // 给文本框
//    _nameField.text = contact.name;
//    _phoneField.text = contact.phone;
//}

// 点击保存需要做的事情
- (IBAction)save:(UIButton *)sender {
    //   修改模型数据
    _contact.name = _nameField.text;
    _contact.phone = _phoneField.text;
//   通知联系人控制器修改了模型数据，刷新表格
    //  让小弟做时期
    if (_block) {
        _block();
    }
    //   返回上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条的标题
    self.title = @"查看/编辑界面";
    //设置导航条右边的按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)];
    
    // 给文本框
    _nameField.text = _contact.name;
    _phoneField.text = _contact.phone;
    // 监听文本框
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //  判断一下是否点击了
    [self textChange];
}

-(void)textChange
{
    self.saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
}

-(void)edit:(UIBarButtonItem*)item
{
//    NSLog(@"%@",item);
    //  更改标题
    if ([item.title isEqualToString:@"编辑"]) {
        item.title = @"取消";
        //  让文本框允许编辑
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        //  弹出电话文本框的内存
        [_phoneField becomeFirstResponder];
        //  显示保存按钮
        _saveBtn.hidden = NO;

    }else{
        item.title = @"编辑";
        //  退出键盘
//        [self.view endEditing:YES];
        //  隐藏保存按钮
        _saveBtn.hidden = YES;
        //  让文本框不允许编辑
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        //  还原模型
        _nameField.text = _contact.name;
        _phoneField.text = _contact.phone;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
