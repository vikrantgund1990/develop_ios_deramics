//
//  Constant.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "Constant.h"
#import "HomeViewController.h"
#import <UIKit/UIKit.h>
#define QA_URL "http://qa.ceramicskart.com/api/";
#define LIVE_URL "http://mytyles.com/API/";
#define isLive false
@implementation Constant
#if isLive
NSString const *BASE_URL = @LIVE_URL;
#else
NSString const *BASE_URL = @QA_URL;
#endif

+(void)ReDirectToHome
{
    AppDelegate *appDelegateObj=DELEGATE;
    UIViewController *con = [appDelegateObj.holderStack lastObject];
    [con.navigationController popToRootViewControllerAnimated:YES];

}
+(CGFloat)returnWidth{
    CGRect frm=[[UIScreen mainScreen]bounds];
    return frm.size.width;
}
+(CGFloat)returnHeight{
    CGRect frm=[[UIScreen mainScreen]bounds];
    return frm.size.height;
}
@end
