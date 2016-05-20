//
//  ViewController.m
//  08-倒影效果
//
//  Created by yhp on 16/5/20.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPReplicatorView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YHPReplicatorView *repLView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAReplicatorLayer* layer = (CAReplicatorLayer*)_repLView.layer;
    layer.instanceCount = 2;
    //  往下平移
    CATransform3D transform = CATransform3DMakeTranslation(0, _repLView.bounds.size.height, 0);
    transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
    layer.instanceTransform = transform;
//    layer.instanceAlphaOffset = -0.1;
    layer.instanceRedOffset = -0.1;
    layer.instanceGreenOffset = -0.1;
    layer.instanceBlueOffset = -0.1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
