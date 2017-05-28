//
//  CustomTextfield.m
//  Ceramics
//
//  Created by Martand Joshi on 25/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "CustomTextfield.h"
#import "UIColor+commonColor.h"

@implementation CustomTextfield

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 5;
    [self setBorderStyle:UITextBorderStyleNone];
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor appColor] CGColor];
    self.layer.backgroundColor = [[UIColor whiteColor]CGColor];
    [self setLeftPadding:15];
}
-(void) setLeftPadding:(int) paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
@end
