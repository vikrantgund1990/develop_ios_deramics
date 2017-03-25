//
//  UserDefults.m
//  MyTyles
//
//  Created by Martand Joshi on 25/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "UserDefults.h"

@implementation UserDefults
#pragma mark - Device Location
+(void)saveLocationInformationLatLon:(NSString*)latitude longitude:(NSString*)longitude{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:latitude forKey:@"Latitude"];
    [userDefaults setObject:longitude forKey:@"Longitude"];
    [userDefaults synchronize];
}
+(void)saveLocationInformationAddrCity:(NSString*)address city:(NSString*)city{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:address forKey:@"Address"];
    [userDefaults setObject:city forKey:@"City"];
    [userDefaults synchronize];
}
+(NSString*)getLatitude{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *latitude = [userDefaults valueForKey:@"Latitude"];
    
    if(latitude==nil)
        latitude = @"0";
    
    return latitude;
}
+(NSString*)getLongitude{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *longitude = [userDefaults valueForKey:@"Longitude"];
    
    if(longitude==nil)
        longitude = @"0";
    
    return longitude;
}
+(NSString*)getLocationAddress{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *address = [userDefaults valueForKey:@"Address"];
    
    if(address==nil)
        address = @"NA";
    
    return address;
}
+(NSString*)getLocationCity{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *city = [userDefaults valueForKey:@"City"];
    return city;
}
+(BOOL)isRefferalCodeshown{
    
    NSUserDefaults *userDefaluts = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaluts objectForKey:@"RefferalCode"];
    
    if(!data)
        return NO;
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return [[dict objectForKey:@"RefferalCode"]boolValue];
    
    return NO;
}

+(void)saveRefferalCodeStatus:(BOOL)visibilty{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dict =@{@"RefferalCode":[NSNumber numberWithBool:visibilty]};
    
    [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:dict] forKey:@"RefferalCode"];
    [userDefaults synchronize];
}
@end
