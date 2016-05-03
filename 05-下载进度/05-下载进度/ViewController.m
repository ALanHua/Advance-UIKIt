//
//  ViewController.m
//  05-下载进度
//
//  Created by yhp on 16/4/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelView;
@property (weak, nonatomic) IBOutlet YHPProgressView *progressView;

@end

@implementation ViewController

- (IBAction)progressChange:(UISlider *)sender {
    //   获取滑块的值
    //    %% = %
    _labelView.text = [NSString stringWithFormat:@"%.2f%%",sender.value*100];
    _progressView.progress = sender.value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
