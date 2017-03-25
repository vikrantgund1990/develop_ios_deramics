//
//  ActionBar.h
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionBar : UIView{
    IBOutlet UIView *internalView;
}
@property (nonatomic)IBOutlet UILabel *lblTitle;
@property IBOutlet UIButton *btnBack,*btnLeftMenu;
- (id)init:(NSString *)title callingView:(UIViewController*)callingView;
+(void)leftSliderToggle;
-(void)setActionBarViewBtnBack:(BOOL)btnBack leftMenu:(BOOL)leftMenu;
+(void)popCurrentViewController:(BOOL)animated;
@end
