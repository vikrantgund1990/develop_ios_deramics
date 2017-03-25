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
#import <CoreLocation/CoreLocation.h>
#import "UserDefults.h"
#import "SplashScreenVC.h"

@interface AppDelegate (){
    bool isLocationServiceOff,isAlertClicked;
}
@property (nonatomic,retain)CLLocationManager *location;
@property (nonatomic,retain)CLPlacemark *placemark;


@end

@implementation AppDelegate
CLLocationManager *locationManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    HomeViewController *homeViewController=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    SplashScreenVC *splashScreenVC = [[SplashScreenVC alloc]initWithNibName:@"SplashScreenVC" bundle:nil];
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
    
    //Location
     isLocationServiceOff=YES;
    if ([CLLocationManager locationServicesEnabled]){
        isLocationServiceOff=NO;
    }
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [locationManager requestWhenInUseAuthorization];
    }
    isAlertClicked=NO;
   
    [locationManager startUpdatingLocation];
    
     self.window.rootViewController=splashScreenVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(void)startMainScreen{
    if(isAlertClicked||!isLocationServiceOff){
    [UIView transitionWithView:self.window duration:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.window.rootViewController = self.slider;
        
    } completion:nil];
    }
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
#pragma mark - Device Location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    [manager stopUpdatingLocation];
    
    switch([error code])
    {
        case kCLAuthorizationStatusNotDetermined:
        case kCLErrorNetwork: // general, network-related error
        {
            isLocationServiceOff=YES;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"please check your network connection or that you are not in airplane mode" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;
        case kCLErrorDenied:{
            isLocationServiceOff=YES;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"You can enable Location for Ceramics from Settings > Privacy > Location Services" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
            break;
        default:
        {
            isLocationServiceOff=NO;
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to get your location" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
        }
            break;
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    //    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        NSString *latString = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
        NSString *longString = [NSString stringWithFormat:@"%f", currentLocation.coordinate.longitude];
        // storing for next time usage
        [UserDefults saveLocationInformationLatLon:latString longitude:longString];
        
    }
    
    [locationManager stopUpdatingLocation];
    [self GetLocationAddress];
}

-(void)GetLocationAddress{
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    //geocodelocation
    
    [geocoder reverseGeocodeLocation:locationManager.location completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         
         //Get address
         self.placemark = [placemarks objectAtIndex:0];
         NSString *address = [[self.placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
         
         //         NSLog(@"City Name: %@",[placemark locality]);
         
         [UserDefults saveLocationInformationAddrCity:address city:[self.placemark locality]];
         
     }];
}

//>= iOS8
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            // do some error handling
        }
            break;
        default:{
            [locationManager startUpdatingLocation];
        }
            break;
    }
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
       // tag 1 indicate permission given
        alertView.tag=1;
        isAlertClicked=YES;
        [self startMainScreen];
    }
    else{
        //tag 2 indicate permision denied
        alertView.tag=2;
        isAlertClicked=YES;
        [self startMainScreen];
    }
}
@end
