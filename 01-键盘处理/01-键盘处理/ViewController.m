//
//  ViewController.m
//  01-键盘处理
//
//  Created by yhp on 16/3/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPProvince.h"

@interface ViewController () <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource >

@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak,nonatomic) UIDatePicker* datePicker;
@property (weak,nonatomic) UIPickerView* pickerView;
/** 成员属性 */
@property(nonatomic,strong)NSMutableArray* provinces;
/** 保存省会角标 */
@property(nonatomic,assign)NSInteger proIndex;
@end

@implementation ViewController

- (NSMutableArray *)provinces
{
    if (_provinces == nil) {
        // 装所有省会
        _provinces = [NSMutableArray array];
        // 字典船模型
        NSString* path = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        NSArray* arr = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary* dict  in arr) {
            YHPProvince* p = [YHPProvince provinceWithDict:dict];
            [_provinces addObject:p];
        }
    }
    
    return _provinces;
}



#pragma mark - <UITextFieldDelegate>
//不允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
{
    return NO;
}
// 开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _birthdayField) {
        //    获取当前datePicker当前日期
        [self dateChange:self.datePicker];
    }else{
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    }

}
#pragma mark - 监听UIDatePicker的滚动事件
-(void)dateChange:(UIDatePicker*)datePicker
{
    //    NSLog(@"%@",datePicker.date);
    //    日期转换成字符串
    NSDateFormatter* fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString* dateString = [fmt stringFromDate:datePicker.date];
    self.birthdayField.text = dateString;
}
#pragma mark - 自定义生日键盘
-(void)setUpBirthdayKeyboard
{
//    创建UIDatePicker
//    注意UIDatePick 有默认尺寸，不需要设置尺寸
    UIDatePicker* picker =  [[UIDatePicker alloc]init];
    self.datePicker = picker;
//    设置地区 zh---中国
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
//    设置日期的模式
    picker.datePickerMode = UIDatePickerModeDate;
//    监听UIDatePicker的滚动
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    self.birthdayField.inputView = picker;
}
-(void) setUpCityKeyboard
{
    UIPickerView* pickerView = [[UIPickerView alloc]init];
    self.pickerView = pickerView;
    
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    
    self.cityField.inputView = pickerView;
}

#pragma mark - <UIPickerViewDelegate>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinces.count;
    }else{
    //  获取省会
        YHPProvince* p = self.provinces[self.proIndex];
        return p.cities.count;
    }
}

// 全局断点就是帮我们定位错误的那一行
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.provinces[row] name];
    }else{
        YHPProvince* p = self.provinces[self.proIndex];
        return p.cities[row];
    }
}

// 监听滚动
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0){ //刷新省会
        //   记录当前选中省会
        self.proIndex = [pickerView selectedRowInComponent:0];
        [pickerView reloadComponent:1];//刷新数据
    }
    //  获取省会
    YHPProvince* p = self.provinces[self.proIndex];
    // 湖区选中的城市
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    NSString* cityName = p.cities[cityIndex];
    
    self.cityField.text = [NSString stringWithFormat:@"%@ %@",p.name,cityName];
}

#pragma mark - 加载控制器
- (void)viewDidLoad {
    [super viewDidLoad];
    self.birthdayField.delegate = self;
    self.cityField.delegate = self;
    
    //    自定义生日键盘
    [self setUpBirthdayKeyboard];
    //    自定义城市键盘
    [self setUpCityKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
