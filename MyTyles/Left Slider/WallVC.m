//
//  WallVC.m
//  MyTyles
//
//  Created by Martand Joshi on 12/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "WallVC.h"
#import "ActionBar.h"
#import "WebServiceController.h"
#import"ProductListCell.h"
#import "UIColor+commonColor.h"
#import "UIImageView+AFNetworking.h"
#import "UserDefults.h"
@interface WallVC (){
    NSArray *data;
    
}
@property IBOutlet UICollectionView *cvWallList;
@end

@implementation WallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ActionBar *actionBar=[[ActionBar alloc]init:@"Wall" callingView:self];
    [self.view addSubview:actionBar];
    
    [self getWallData];
    [_cvWallList registerNib:[UINib nibWithNibName:@"ProductListCell" bundle:nil] forCellWithReuseIdentifier:@"ProductListCell"];
    [_cvWallList setBackgroundColor:[UIColor appColor]];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"ProductListCell";
    __weak ProductListCell *productListCell=(ProductListCell *)[_cvWallList dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
 
  
    NSDictionary *dictObj=[data objectAtIndex:indexPath.row];
    
    productListCell.lblProductName.text=[[dictObj objectForKey:@"productId"]stringValue];
     [productListCell.lblProductName setTextColor:[UIColor text_color]];
    [productListCell setBackgroundColor:[UIColor whiteColor]];
    [productListCell.viewInternal setBackgroundColor:[UIColor appColor]];
//    http://images.ceramicskart.com/img/
      [productListCell.ivProduct setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/%@.png",[[dictObj objectForKey:@"productId"]stringValue]]]  placeholderImage:[UIImage imageNamed:@"stub_image"]];

    return productListCell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [data count];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
}
-(void)getWallData{
    //http://qa.ceramicskart.com/api/Product/Type/floor/Mumbai
    NSString *strURL=[NSString stringWithFormat:@"Product/Type/Wall/%@",[UserDefults getLocationCity]];
    [[WebServiceController sharedInstance]GetMethod:self url:strURL isSync:true parameters:
     nil response:^(id dictObj) {
         if([[dictObj objectForKey:@"status"]boolValue]){
             data=[dictObj objectForKey:@"data"];
              [_cvWallList reloadData];
         }
     }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize mElementSize = CGSizeMake(([Constant returnWidth]-20)/2, 150);
 
    return mElementSize;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
