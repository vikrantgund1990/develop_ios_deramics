//
//  ProductListCellCollectionViewCell.m
//  CorpRewardz
//
//  Created by Martand Joshi on 31/01/17.
//  Copyright © 2017 Loylty Rewardz. All rights reserved.
//

#import "ProductListCell.h"

@implementation ProductListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _viewInternal.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _viewInternal.layer.borderWidth=0.7f;
    [_viewInternal setBackgroundColor:[UIColor whiteColor]];
}

@end
