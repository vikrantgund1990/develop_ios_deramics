//
//  CustomButton.m
//  Ceramics
//
//  Created by Martand Joshi on 25/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "CustomButton.h"
#import "UIColor+commonColor.h"
@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        CGRect frame = self.frame;
//        frame.size.height = frame.size.height + 5;
//        self.frame = frame;
        
        [self setBackgroundColor:[UIColor appColor]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    self.layer.cornerRadius = 5.0;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [[UIColor appColor] CGColor];
}

@end
