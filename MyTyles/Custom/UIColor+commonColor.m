//
//  UIColor+commonColor.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "UIColor+commonColor.h"

@implementation UIColor (commonColor)
+(UIColor *) appColor{
    return [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
}
+(UIColor*)text_color{
    return [UIColor colorWithRed:146/255.0f green:146/255.0f blue:146/255.0f alpha:1];
}
+(UIColor*)custom_gray{
      return [UIColor colorWithRed:231/255.0f green:231/255.0f blue:231/255.0f alpha:1];
}
+(UIColor*)custom_orange{
    return [UIColor colorWithRed:249/255.0f green:166/255.0f blue:12/255.0f alpha:1];
}
@end
