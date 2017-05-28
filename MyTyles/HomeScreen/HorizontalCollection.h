//
//  HorizontalCollection.h
//  Ceramics
//
//  Created by Martand Joshi on 24/04/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalCollection : UICollectionViewCell
@property(nonatomic)IBOutlet UIImageView *imgView;
@property(nonatomic)IBOutlet UIButton *btnNext,*btnPrevious;
@property(nonatomic)IBOutlet UIView *viewhalf,*viewSecondhalf;

@end
