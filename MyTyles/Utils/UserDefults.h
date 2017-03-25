//
//  UserDefults.h
//  MyTyles
//
//  Created by Martand Joshi on 25/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefults : NSObject
+(void)saveLocationInformationLatLon:(NSString*)latitude longitude:(NSString*)longitude;
+(void)saveLocationInformationAddrCity:(NSString*)address city:(NSString*)city;

+(NSString*)getLatitude;
+(NSString*)getLongitude;
+(NSString*)getLocationAddress;
+(NSString*)getLocationCity;
+(void)saveRefferalCodeStatus:(BOOL)visibilty;
+(BOOL)isRefferalCodeshown;
@end
