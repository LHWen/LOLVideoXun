//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "MoreNetManager.h"
#import "WelcomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   [self initializeWithApplication:application];
    /** 手动初始化window */
      self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    /** 获取info 路径 */
         NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
    /*
     版本号：version，build
     区别：
     version：正式发布版本号。用户只能看到version
     build：测试版本号，对于程序员来说的
     */
    //已运行过的版本号需要持久化处理，通常存储在userDefault中
        NSString *key = @"CFBundleShortVersionString";
        NSString *currentVersion = infoDic[key];
   /** 已经运行了的版本号需要持久化处理，通常存放在userDdfault中 */
    NSString *runVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (runVersion == nil || ![runVersion isEqualToString:currentVersion]) {
        /** 第一次显示添加欢迎界面 */
        //xib的获取vc的方法
        // WelcomeViewController *welcomVC = [[WelcomeViewController alloc]initWithNibName:@"WelcomeViewController" bundle:nil];
        WelcomeViewController *vc  = [storyboard instantiateViewControllerWithIdentifier:@"Welcome"];
        self.window.rootViewController = vc;
        /** 保存新版本号 */
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
    }else{
        /** 没有更新已经不是第一次进入就直奔主题 */
        UITabBarController *mainVC = [storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
        self.window.rootViewController = mainVC;
    }
    
    [self configGlobalUIStyle];
    return YES;
}

/** 配置全局UI样式 */
- (void)configGlobalUIStyle {
    /** 设置导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"mengche.jpg"] forBarMetrics:UIBarMetricsDefault];
}

@end
