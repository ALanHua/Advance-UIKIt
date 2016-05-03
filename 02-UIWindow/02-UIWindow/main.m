//
//  main.m
//  02-UIWindow
//
//  Created by yhp on 16/3/30.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
// main -> UIApplicationMain
/**
 UIApplicationMain
 1,创建UIApplication
 2,创建UIApplicationDelegate,并且成为UIApplication代理
 3,开启主运行循环，保持程序一直运行
 4,加载info.plist,判断有没有指定main.stroyboard,指定了就加载
 
 
 加载main.stroyboard
 1，加载窗口
 2，加载main.stroyboard
 3, 把新创建的控制器作为窗口的根控制器，然窗口显示出来
 

*/