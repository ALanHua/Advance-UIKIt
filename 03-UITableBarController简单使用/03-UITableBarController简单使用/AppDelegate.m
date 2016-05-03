//
//  AppDelegate.m
//  03-UITableBarController简单使用
//
//  Created by yhp on 16/4/19.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //    创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //    设置窗口的根控制器
    UITabBarController* tabBarVc = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarVc;
    //    1
    UIViewController* vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [tabBarVc addChildViewController:vc];
    //    设置按钮上面的内容
    vc.tabBarItem.title = @"消息";
    vc.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
   vc.tabBarItem.badgeValue =@"1000";
    //    2
    UIViewController* vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor greenColor];
    [tabBarVc addChildViewController:vc1];
    vc1.tabBarItem.title = @"联系人";
    vc1.tabBarItem.badgeValue = @"10";
    //    显示窗口
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
