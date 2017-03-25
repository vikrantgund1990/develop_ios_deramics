//
//  SplashScreenVC.m
//  MaxGetMore
//
//  Created by Jugal Desai on 1/7/15.
//  Copyright (c) 2015 Loylty Rewardz. All rights reserved.
//

#import "SplashScreenVC.h"
#import "AppDelegate.h"
#import "WebServiceController.h"
#import "Constant.h"
#import "UserDefults.h"


@interface SplashScreenVC ()<UIAlertViewDelegate>{

    
    __weak IBOutlet UIActivityIndicatorView *activityIndicatorView;
}
@end

@implementation SplashScreenVC

NSTimer *timer;
long const MAX_VALUE = 4;
int counterValue;
BOOL hasWebServiceCallReturned;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [activityIndicatorView startAnimating];
    counterValue = 0;
    [self startTimer];
  //  [self SplashAppVersionApi];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTimer:(id)sender{
    if(counterValue >= MAX_VALUE){
        [self killTimer];
    }
    
//    NSLog(@"%@",[NSString stringWithFormat:@"%d", counterValue]);
    counterValue++;
}

-(void)startTimer{
    counterValue = 0;
    
  //  [self killTimer];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    
   // [self updateTimer:timer];
}

- (void)killTimer{
    if(timer){
        [timer invalidate];
        timer = nil;
        
        [self redirectToHomeScreen];
    }
}

-(void)redirectToHomeScreen{
    
    // check if both the conditions satisfy then only enter the app.
    if(counterValue >= MAX_VALUE){
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate startMainScreen];
    }
}
-(void)SplashAppVersionApi
{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [dict setValue:appVersionString forKey:@"AppVersion"];
//    [dict setValue:@"2.2" forKey:@"AppVersion"];
    [dict setValue:@"IOS" forKey:@"DeviceType"];
//    [[WebServiceController sharedInstance]getAppVersionDetail:self dict:dict isSync:false response:^(NSDictionary* dictObj){
//        
//        hasWebServiceCallReturned=YES;
//        
//        if(dictObj){
//            
//            BOOL isUpdateAvailable=[[dictObj valueForKey:@"IsUpdateAvailable"]boolValue];
//            if(isUpdateAvailable){
//                NSString *msg=[dictObj valueForKey:@"Message"];
//                isForcedUpdate=[[dictObj valueForKey:@"IsForcedUpdate"]boolValue];
//                [self alertmsg:msg];
//            }
//        }
//        
//        [self redirectToHomeScreen];
//    } responseError:^(NSString *errorMessage) {
//        hasWebServiceCallReturned = YES;
//        [self redirectToHomeScreen];
//    }];
}



@end
