//
//  AppDelegate.m
//  GuidePage
//
//  Created by sarah on 15/12/15.
//  Copyright © 2015年 william. All rights reserved.
//

#import "AppDelegate.h"
#import "GuidePageViewController.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    //设置引导图片
    NSArray *arr = [NSArray arrayWithObjects:@"0.jpg",@"1.jpg",@"3.jpg",nil];

    //使用的时候用key+版本号替代UserHasGuideView
    //这样容易控制每个版本都可以显示引导图
    BOOL userIsFirstInstalled = [[NSUserDefaults standardUserDefaults] boolForKey:@"UserHasGuideView"];
    if (userIsFirstInstalled)
    {
        self.window.rootViewController = [[SecondViewController alloc]init];
    }
    else
    {
        self.window.rootViewController = [[GuidePageViewController alloc]initWithPicArr:arr andRootVC:[[SecondViewController alloc]init]];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"UserHasGuideView"];
    }
    
    
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
