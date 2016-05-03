//
//  AppDelegate.m
//  02-控制器的创建xib
//
//  Created by yhp on 16/3/31.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/*
 通过xib创建控制器的View
 1,一定要描述xib的文件拥有者是控制器，也就是说这个xib是用来描述控制器
 2，然后需要将这个view和控制器绑定到一起
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    通过xib创建控制器
//    1，如果控制器View的xib跟类名相同但不带controller。默认就会去加载
//    2，如果控制器View的xib跟类名相同。默认就会去加载
//    3,如果还没找到就创建一个空的View
//    ViewController* vc = [[ViewController alloc]initWithNibName:nil bundle:nil];
    ViewController* vc = [[ViewController alloc]init];//默认加载上面的方法
    
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
