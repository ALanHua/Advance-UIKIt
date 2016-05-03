//
//  ViewController.m
//  01-国旗选择
//
//  Created by yhp on 16/3/27.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPFlag.h"
#import "YHPFlagView.h"


@interface ViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

/** 属性 */
@property(nonatomic,strong)NSArray* flags;

@end

@implementation ViewController


- (NSArray *)flags
{
    if (_flags == nil) {
        //加载plist
        NSString* path =  [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray* arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray* flagArray = [NSMutableArray array];
        for (NSDictionary* dict in arr) {
            //字典转模型
            YHPFlag* flag = [YHPFlag flagWithDict:dict];
            [flagArray addObject:flag];
        }
        _flags = flagArray;
    }
//    NSLog(@"%@",_flags);
    return _flags;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flags.count;
}

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    YHPFlagView* flagView = [YHPFlagView flagViewWithFlag:self.flags[row]];
    return flagView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
    return 60;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
