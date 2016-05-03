//
//  ViewController.m
//  01-点菜系统
//
//  Created by yhp on 16/3/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

/** 成员数组 */
@property(nonatomic,strong)NSArray* foods;
@end

@implementation ViewController

- (IBAction)random:(UIButton *)sender {
    // pickView随机选中
    // 假设让第0列随机选中一行
    for (int i =0 ; i < self.foods.count; i++) {
        
        NSUInteger count = [self.foods[i] count];
        int random = arc4random_uniform((u_int32_t)count) ;
        [self.pickView selectRow:random inComponent:i animated:YES];
        //  主动给label 赋值
        [self pickerView:self.pickView didSelectRow:random inComponent:i];
    }
}


-(NSArray*)foods
{
    if (_foods == nil) {
    //    加载plist文件
       NSString* path = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
    //   大树组
        _foods = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _foods;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    for (int i = 0; i < 3; i++) {
        [self pickerView:self.pickView didSelectRow:0 inComponent:i];
    }
//    self.fruitLabel.text = self.foods[0][0];
//    self.mainLabel.text = self.foods[1][0];
//    self.drinkLabel.text = self.foods[2][0];
}
#pragma mark - <UIPickerViewDelegate>
// 返回pickView有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}
// 第component列有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foods[component] count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foods[component][row];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 45;
}
// 选中
// 注意：这个方法必须用户主动拖动pickView
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            // 水果
            self.fruitLabel.text = self.foods[component][row];
            break;
        case 1:
            // 主食
             self.mainLabel.text = self.foods[component][row];
            break;
        case 2:
            // 饮料
             self.drinkLabel.text = self.foods[component][row];
            break;
        default:
            break;
    }
}

@end
