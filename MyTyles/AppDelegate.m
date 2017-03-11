//
//  AppDelegate.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LeftSlider.h"
#import "MFSideMenuContainerViewController.h"
#import "Constant.h"
#import "MFSideMenu.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    HomeViewController *homeViewController=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    
    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:homeViewController];
    UINavigationBar *navBar = navController.navigationBar;
    [navBar setHidden:YES];
    if([navController respondsToSelector:(@selector(interactivePopGestureRecognizer))]) {
        navController.interactivePopGestureRecognizer.enabled=NO;
    }
    LeftSlider *leftSlider=[[LeftSlider alloc]init];
    leftSlider.view.frame=self.window.frame;
    self.slider=[MFSideMenuContainerViewController containerWithCenterViewController:navController leftMenuViewController:leftSlider rightMenuViewController:nil];
    [self.slider setPanMode:MFSideMenuPanModeNone];
    
  [UIView transitionWithView:self.window duration:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.window.rootViewController = self.slider;
        
    } completion:nil];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
        [self handleRemoteNotifications:userInfo];
    
}

-(void)handleRemoteNotifications:(NSDictionary *)userInfo {
    
    UIViewController *con = [_holderStack lastObject];
    [con.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

@end
