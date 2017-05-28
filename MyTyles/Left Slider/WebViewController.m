//
//  WebViewController.m
//  HDFCPerks
//
//  Created by Hari Nadar on 18/09/15.
//  Copyright (c) 2015 Loylty Rewardz. All rights reserved.
//

#import "WebViewController.h"
#import "ActionBar.h"
#import "Constant.h"
#import "CustomActivityIndicatorView.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController
@synthesize urlToLoad;
CustomActivityIndicatorView *customIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   // [holderStack addObject:self];
    
    ActionBar *actionBar=[[ActionBar alloc]init:@"CeramicsKart" callingView:self];
    [self.view addSubview:actionBar];
    
    customIndicator = [[CustomActivityIndicatorView alloc]init];
    _webView.delegate = self;
    
    //if(urlToLoad == (id)[NSNull null])
        urlToLoad = @"www.google.co.in";
    urlToLoad = [urlToLoad stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:[urlToLoad stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view addSubview:customIndicator];
    [customIndicator showCustomIndicatorView:self];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    customIndicator.hidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
