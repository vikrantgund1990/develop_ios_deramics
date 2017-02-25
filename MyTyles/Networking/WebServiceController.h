//
//  WebServiceController.h
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebServiceController : NSObject
-(void)PostMethod:(UIViewController*)callingView url:(NSString*)url isSync:(BOOL)isSync parameters:(NSDictionary*)urlParameters response:(void (^) (id dictObj))responses;
-(void)GetMethod:(UIViewController*)callingView url:(NSString*)url isSync:(BOOL)isSync parameters:(NSDictionary*)urlParameters response:(void (^) (id dictObj))responses;
+ (WebServiceController *)sharedInstance;
@end
