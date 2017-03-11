//
//  ActionBar.h
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionBar : UIView
@property (nonatomic)IBOutlet UILabel *lblTitle;
- (id)init:(NSString *)title callingView:(UIViewController*)callingView;
@end
