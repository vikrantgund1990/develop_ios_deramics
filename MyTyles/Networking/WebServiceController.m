//
//  WebServiceController.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "WebServiceController.h"
#import "CustomActivityIndicatorView.h"
#import "Constant.h"
#import "AFNetworking.h"

@implementation WebServiceController
static CustomActivityIndicatorView *customActivityIndicatorView;
+ (WebServiceController *)sharedInstance{
        static WebServiceController *_sharedInstance = nil;
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
        customActivityIndicatorView = [[CustomActivityIndicatorView alloc]init];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
        _sharedInstance = [[WebServiceController alloc] init];
    });
    return _sharedInstance;
}
//Inititalization of Indicator View
#pragma mark - GENERAL Initialization
-(void)initialization:(UIViewController*)callingView isSync:(BOOL)isSync{
    if([customActivityIndicatorView isShowingCustomIndicatorView])
    {
        [customActivityIndicatorView stopCustomIndicatorView];
    }
    customActivityIndicatorView = [[CustomActivityIndicatorView alloc]init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    if(isSync){
        [callingView.view addSubview:customActivityIndicatorView];
        [customActivityIndicatorView showCustomIndicatorView:callingView];
    }
}

-(void)GetMethod:(UIViewController*)callingView url:(NSString*)url isSync:(BOOL)isSync parameters:(NSDictionary*)urlParameters response:(void (^) (id dictObj))responses{
      [self initialization:(UIViewController*)callingView isSync:isSync];
     NSString *strURL;
        strURL= [NSString stringWithFormat:@"%@%@",BASE_URL,url];
        AFHTTPSessionManager *manager=[[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
   
    [manager GET:strURL parameters:urlParameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
         responses(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];

    [customActivityIndicatorView stopCustomIndicatorView];
}

-(void)PostMethod:(UIViewController*)callingView url:(NSString*)url isSync:(BOOL)isSync parameters:(NSDictionary*)urlParameters response:(void (^) (id dictObj))responses{
    [self initialization:(UIViewController*)callingView isSync:isSync];
    NSError *error;
    NSDictionary *body=[[NSDictionary alloc]init];;
    if(urlParameters!=nil)
    body = urlParameters;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@%@",BASE_URL,url] parameters:nil error:nil];

    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];

    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [customActivityIndicatorView stopCustomIndicatorView];
        if (!error) {
            responses(responseObject);
        } else {
            //NSLog(@"Error: %@, %@, %@", error, response, responseObject);
        }
    }] resume];
}

@end
