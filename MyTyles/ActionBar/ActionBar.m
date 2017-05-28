//
//  ActionBar.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "ActionBar.h"
#import "Constant.h"
#import "UIColor+commonColor.h"
#import "MFSideMenu.h"
@implementation ActionBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}*/
ActionBar *view;
AppDelegate *appDelegateSharedObj;
- (id)init:(NSString *)title callingView:(UIViewController*)callingView{
    appDelegateSharedObj=DELEGATE;
    CGRect frm=[[UIScreen mainScreen]bounds];
    CGFloat width= frm.size.width;
         return [self initWithFrame:CGRectMake(0, 0, width,60.0) title:title callingView:callingView];
}
 - (id)initWithFrame:(CGRect)frame title:(NSString *)title callingView:(UIViewController*)callingView{
 self = [super initWithFrame:frame];
 if (self) {
     NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ActionBar" owner:self options:nil];
      view = [nib objectAtIndex:0];
    view.backgroundColor = [UIColor appColor];
     internalView.backgroundColor=[UIColor appColor];
     view.lblTitle.text=title;
     [view.lblTitle setTextColor:[UIColor text_color]];
//     CGRect frm=view.frame;
//     frm=frame;
     view.frame=frame;
     if(view!=nil)
         [self addSubview:view];
 }
 return self;
 }
-(void)setActionBarViewBtnBack:(BOOL)btnBack leftMenu:(BOOL)leftMenu
{
    id con = [appDelegateSharedObj.holderStack lastObject];
    [view.btnBack setHidden:btnBack];
   // [view.btnBack setImage:[UIImage imageNamed: @"btnBack"] forState:UIControlStateNormal];
    
    [view.btnLeftMenu setHidden:leftMenu];
}
-(IBAction)leftMenu:(id)sender{
    [ActionBar leftSliderToggle];

}
+(void)leftSliderToggle{
    UIViewController *con = [appDelegateSharedObj.holderStack lastObject];
    [con.menuContainerViewController toggleLeftSideMenuCompletion:^{
    }];
}
-(IBAction)callBack:(id)sender{
        [ActionBar popCurrentViewController:YES];
}
+(void)popCurrentViewController:(BOOL)animated{
    
    UIViewController *con = [appDelegateSharedObj.holderStack lastObject];
    [con.navigationController popViewControllerAnimated:animated];
    [appDelegateSharedObj.holderStack removeLastObject];
}
@end
