//
//  HomeButton.m
//  Ceramics
//
//  Created by Martand Joshi on 28/05/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "HomeButton.h"
#import "UIColor+commonColor.h"
@implementation HomeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = [[UIColor text_color] CGColor];
    self.layer.borderWidth=0.7f;
    [self setTitleColor:[UIColor text_color] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
    
}

@end
