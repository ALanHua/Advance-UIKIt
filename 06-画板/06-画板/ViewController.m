//
//  ViewController.m
//  06-画板
//
//  Created by yhp on 16/5/9.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPDrawView.h"
#import "YHPImageHandleView.h"

@interface ViewController ()<UIImagePickerControllerDelegate,
                             UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet YHPDrawView *drawView;
@end

@implementation ViewController

#pragma mark - 底部按钮监听
- (IBAction)valueChange:(UISlider *)sender {
    
    //  给画板传递线宽
    _drawView.lineWidth = sender.value;
    
}

- (IBAction)colorChange:(UIButton *)sender {
    //  给画板传递颜色
    _drawView.pathColor = sender.backgroundColor;
    
}

#pragma mark - toolBar按钮监听
// -- 擦除
- (IBAction)clear:(UIBarButtonItem *)sender {
    [_drawView clear];
}
// -- 撤销
- (IBAction)unDo:(UIBarButtonItem *)sender {
    [_drawView unDo];
}
// -- 橡皮擦
- (IBAction)eraser:(UIBarButtonItem *)sender {
    
    _drawView.pathColor = [UIColor whiteColor];
}
// -- 照片
- (IBAction)pickPhoto:(UIBarButtonItem *)sender {
//  弹出系统相册
    //  选择控制器（系统相册）
    UIImagePickerController* pickerVc = [[UIImagePickerController alloc]init];
    //   设置选择控制器的来源
    //    UIImagePickerControllerSourceTypeSavedPhotosAlbum 照片
    //    UIImagePickerControllerSourceTypePhotoLibnary 相册集
    pickerVc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    pickerVc.delegate =self;
    //   modal
    [self presentViewController:pickerVc animated:YES completion:nil];
}
// -- 保存
- (IBAction)save:(UIBarButtonItem *)sender {
    
    //  截屏
    //  开启上下文
    UIGraphicsBeginImageContextWithOptions(_drawView.bounds.size, NO, 0);
    //  获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //   渲染绘图
    [_drawView.layer renderInContext:ctx];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    //  关闭上下文
    UIGraphicsEndImageContext();
    //  保存画板的内容
    /*
     image:写入图片
     completionTarget：图片保存监听者
     */
    // 注意：savePhoto保存成功的方法不能乱写
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"保存图片成功");
}
#pragma mark - UIImagePickerControllerDelegate
// 用户选择图片的时候调用
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //  获取选中的照片
    UIImage* image = info[UIImagePickerControllerOriginalImage];
    //  创建一个图片处理的View
    YHPImageHandleView* imageHandleV = [[YHPImageHandleView alloc]initWithFrame:self.drawView.bounds];
    imageHandleV.hanleCompletionBlock = ^(UIImage* image){
        self.drawView.image = image;
    };
    
    [self.drawView addSubview:imageHandleV];
    imageHandleV.image = image;
    
    //  把选中的照片画在画板上
//    _drawView.image = image;
    
    //  dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
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
