//
//  AppDelegate.m
//  EPB_LiShi
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    RootViewController *rootVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"RootViewController"];
    [self.window setRootViewController:rootVC];
    // 初始化欢迎界面背景视图
    self.splashView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:self.splashView.bounds];
    backImg.image = [UIImage imageNamed:@"welcome.jpg"];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    textLabel.text = @"WELCOME LISHI";
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont systemFontOfSize:39];
    textLabel.center = CGPointMake(self.splashView.center.x, self.splashView.center.y + 160);
    // 添加图片
    [self.splashView addSubview:backImg];
    // 添加字体
    [self.splashView addSubview:textLabel];
    [self.window addSubview:self.splashView];
    [self.window bringSubviewToFront:self.splashView];
    [self performSelector:@selector(showImg) withObject:nil afterDelay:1];
    
    
    
    return YES;
}
-(void)showImg{
    [UIView animateKeyframesWithDuration:1 delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeCubicPaced) animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
            self.splashView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
//        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5
//                                      animations:^{
//                                          
//                                          self.splashView.transform = CGAffineTransformMakeScale(1, 1);
//                                      }];
    } completion:^(BOOL finished) {
        [NSThread sleepForTimeInterval:2];
        [self.splashView removeFromSuperview];
    }];
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
