//
//  ProductListCellCollectionViewCell.h
//  CorpRewardz
//
//  Created by Siddhant on 31/01/17.
//  Copyright © 2017 Loylty Rewardz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListCell : UICollectionViewCell
@property IBOutlet UILabel *lblProductName;
@property(weak) IBOutlet UIImageView *ivProduct;
@property(weak) IBOutlet UIView *viewInternal;

@end
