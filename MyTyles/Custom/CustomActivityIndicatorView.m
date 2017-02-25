//
//  CustomActivityIndicatorView.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "CustomActivityIndicatorView.h"
#import "UIColor+commonColor.h"

@implementation CustomActivityIndicatorView

UIActivityIndicatorView *indicatorView;

-(id)init{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    return [self initWithFrame:CGRectMake(0, 60, screenSize.size.width, screenSize.size.height-60)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicatorView.frame = CGRectMake(0.0, 0.0, 80, 80);
        indicatorView.backgroundColor = [UIColor blackColor];
        indicatorView.alpha = 0.5;
        indicatorView.layer.cornerRadius = 15;
        [self addSubview:indicatorView];
    }
    return self;
}

-(void)showCustomIndicatorView:(UIViewController*)callingView{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    indicatorView.center = CGPointMake(screenSize.size.width/2,(callingView.view.frame.size.height-100)/2);
    indicatorView.color = [UIColor appColor];
    [indicatorView bringSubviewToFront:callingView.view];
    [indicatorView startAnimating];
    [self setHidden:false];
}
-(BOOL)isShowingCustomIndicatorView{
    if([indicatorView isHidden]==true){
        return false;
    }
    return true;
}
-(void)stopCustomIndicatorView{
    [indicatorView stopAnimating];
    [self setHidden:true];
}
@end
