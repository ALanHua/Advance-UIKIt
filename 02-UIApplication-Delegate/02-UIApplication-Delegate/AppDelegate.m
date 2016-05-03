//
//  AppDelegate.m
//  02-UIApplication-Delegate
//
//  Created by yhp on 16/3/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
//  学习代理方法知道用来干嘛及调用时间

//
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s",__func__);
    return YES;
}

// 应用程序失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"%s",__func__);
}
// 应用程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
   NSLog(@"%s",__func__);
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
       NSLog(@"%s",__func__);
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

// 当app获取到焦点的时候，app可以和用户交互了
- (void)applicationDidBecomeActive:(UIApplication *)application {
      NSLog(@"%s",__func__);
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// 应用程序销毁
- (void)applicationWillTerminate:(UIApplication *)application {
      NSLog(@"%s",__func__);
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//  内存警告
//  清空缓存
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
     NSLog(@"%s",__func__);
}

@end
