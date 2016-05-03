//
//  YHPContactViewController.m
//  03-小马哥通讯录(登录界面)
//
//  Created by yhp on 16/4/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPContactViewController.h"
#import "YHPAddViewController.h"
#import "YHPEditViewController.h"
#import "YHPContact.h"

@interface YHPContactViewController () <UIActionSheetDelegate,YHPAddViewControllerDelegate>
/** 保存联系人 */
@property(nonatomic,strong)NSMutableArray* contacts;
@end

@implementation YHPContactViewController

#pragma mark - 属性懒加载
- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

// 跳转之前是调用，数据传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    传递联系人控制器
    YHPAddViewController* addVc = segue.destinationViewController;
    addVc.delegate = self;
}

- (void)addViewController:(YHPAddViewController *)addVc didClickAddBtnWithContact:(YHPContact *)contact
{
//    NSLog(@"%@",contact.name);
//    把联系人保存起来
    [self.contacts addObject:contact];
//    刷新表格
    [self.tableView reloadData];
}

- (IBAction)loginOut:(UIBarButtonItem *)sender {
    
    UIActionSheet* sheet = [[UIActionSheet alloc]initWithTitle:@"是否注销" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];// 在View中展示
}

#pragma mark - UIActionSheet
// 点击UIActionSheet上的按钮
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    NSLog(@"%ld",buttonIndex);
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //  取消分割线
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    tableView有数据时有分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    创建标识符
    static NSString* ID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    // 获取模型
    YHPContact* c = self.contacts[indexPath.row];
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phone;
    return cell;
}

#pragma mark - tableView的代理
// 点击cell的时候调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 加载storyboard
    UIStoryboard *storyboard = [UIStoryboard  storyboardWithName:@"Main" bundle:nil];
    // 创建编辑控制器
    YHPEditViewController*  editVc= [storyboard instantiateViewControllerWithIdentifier:@"edit"];
    editVc.contact = self.contacts[indexPath.row];
    editVc.block = ^(){
        [self.tableView reloadData];
    };
    // 跳转到编辑界面
    [self.navigationController pushViewController:editVc animated:YES];
}



@end
