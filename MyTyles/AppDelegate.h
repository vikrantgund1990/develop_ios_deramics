//
//  AppDelegate.h
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenuContainerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) MFSideMenuContainerViewController *slider;
@property (retain, nonatomic) NSMutableArray *holderStack;
-(void)startMainScreen;
@end

