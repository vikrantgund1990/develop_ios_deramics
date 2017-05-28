//
//  MaxGrayButton.m
//  MaxGetMore
//
//  Created by Tariqs on 10/14/14.
//  Copyright (c) 2014 Loylty Rewardz. All rights reserved.
//

#import "MaxGrayButton.h"
#import "UIColor+commonColor.h"

@implementation MaxGrayButton

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
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    self.layer.cornerRadius = 5;
    [self setTitleColor:[UIColor text_color] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [[UIColor custom_gray] CGColor];
}

@end
