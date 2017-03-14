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
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"ProductListCell";
    __weak ProductListCell *productListCell=(ProductListCell *)[_cvWallList dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
//    ProductListModel *productListModel=[MTLJSONAdapter modelOfClass:ProductListModel.class fromJSONDictionary:[_productListArray objectAtIndex:indexPath.row] error:nil];
    NSDictionary *dictObj=[data objectAtIndex:indexPath.row];
    
    productListCell.lblProductName.text=[[dictObj objectForKey:@"productId"]stringValue];
    
   
//    [productListCell.ivProduct setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:]] placeholderImage:[UIImage imageNamed:@"stub_merchandise"] success:^(NSURLRequest *request,   NSHTTPURLResponse *response, UIImage *image) {
//        if (productListCell!=NULL)
//        {
//            productListCell.ivProduct.image = image;
//            [productListCell setNeedsLayout];
//        }
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    return productListCell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [data count];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
}
-(void)getWallData{
    [[WebServiceController sharedInstance]GetMethod:self url:@"Product/Type/Floor" isSync:true parameters:
     nil response:^(id dictObj) {
         if([[dictObj objectForKey:@"status"]boolValue]){
             data=[dictObj objectForKey:@"data"];
              [_cvWallList reloadData];
         }
     }];
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
