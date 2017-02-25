//
//  CustomActivityIndicatorView.h
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivityIndicatorView : UIView

-(void)showCustomIndicatorView:(UIViewController*)callingView;
-(void)stopCustomIndicatorView;
-(BOOL)isShowingCustomIndicatorView;
@end
