//
//  HomeViewController.m
//  MyTyles
//
//  Created by Martand Joshi on 25/02/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "HomeViewController.h"
#import "WebServiceController.h"
#import "HomeMenuCell.h"
#import "UIColor+commonColor.h"
#import "ActionBar.h"
#import "Constant.h"
#import "MFSideMenu.h"
#import "UIImageView+AFNetworking.h"
#import "UserDefults.h"
#import "WallVC.h"
#import "FloorVC.h"
#import <CoreLocation/CoreLocation.h>
#import "CityCell.h"
#import "HorizontalCollection.h"
#import "KIImagePager.h"

@interface HomeViewController ()<KIImagePagerDelegate, KIImagePagerDataSource>{
    IBOutlet UITableView *tblView,*tblcity;
    IBOutlet UITextField *txtRefralCode;
    NSArray *productArray,*ImageArray,*data;
    IBOutlet UIView *viewButton,*viewRefferalCode,*tempActionBar,*viewProductApplication,* viewRefCode;
    CLLocationManager *locationManager;
    NSIndexPath *nextIndexPath,*previousIndexPath;
    UIPageControl *pageControl;
    int indexOffset;
    IBOutlet KIImagePager *_imagePager;
    ActionBar *actionBar;
}



//@property (nonatomic, retain) IBOutlet UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    indexOffset=0;
    AppDelegate *appDelegate=DELEGATE;
    appDelegate.holderStack=[[NSMutableArray alloc]init];
    [appDelegate.holderStack addObject:self];
    
    //locationManager = [[CLLocationManager alloc] init];
    //self.collectionView.delegate=self;
    
//    if ([locationManager locationServicesEnabled]){
       [self showHomeScreen];
//    }
//    else{
//        [viewRefferalCode setHidden:TRUE];
//        [self getCity];
//    }
     viewRefCode.layer.cornerRadius = 5.0;
    [tblcity registerNib:[UINib nibWithNibName:@"CityCell" bundle:nil] forCellReuseIdentifier:@"CityCell"];
//    [self.collectionView registerNib:[UINib nibWithNibName:@"HorizontalCollection" bundle:nil] forCellWithReuseIdentifier:@"HorizontalCollection"];
    
    CGRect frame =_imagePager.frame;
    frame.size.width=[Constant returnWidth];
   frame.size.height=[Constant returnHeight]*0.3;
    _imagePager.frame=frame;
    
      UIView *newView = [[UIView alloc] initWithFrame:_imagePager.frame];
      frame=newView.frame;
//    self.collectionView.pagingEnabled=true;
//    self.collectionView.delegate=self;
//    self.collectionView.dataSource=self;
      [newView addSubview:_imagePager];
    
//    pageControl = [[UIPageControl alloc] init];
//    pageControl.frame = CGRectMake(frame.origin.x, frame.size.height-50, [Constant returnWidth], 50);
//    pageControl.numberOfPages = ImageArray.count;
//    pageControl.currentPage = 0;
//    [newView addSubview:pageControl];
    //[pageControl setHidden:true];
    
    CGRect viewProduct=viewProductApplication.frame;
    viewProduct.origin.y=_imagePager.frame.size.height;
    viewProduct.size.width=[Constant returnWidth];
    viewProduct.size.height=[Constant returnHeight]*0.08;
    viewProductApplication.frame=viewProduct;
    
    frame.size.height=frame.size.height+viewProductApplication.frame.size.height;
    newView.frame=frame;
    [newView addSubview:viewProductApplication];
    
    [tblView setTableHeaderView:newView];
    
    frame=viewButton.frame;
    frame.size.width=[Constant returnWidth];
    viewButton.frame=frame;
    [tblView setTableFooterView:viewButton];
}
-(void)viewDidAppear:(BOOL)animated{
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.slideshowTimeInterval = 3.0f;
    _imagePager.slideshowShouldCallScrollToDelegate = YES;
}
#pragma mark - KIImagePager DataSource
- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
//    [productListCell.imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/home/%@",[ImageArray objectAtIndex:indexPath.row%ImageArray.count]]]  placeholderImage:[UIImage imageNamed:@"stub_image"]];
//    @[
//      @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen1.png",
//      @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen2.png",
//      @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen3.png"
//      ];
    NSMutableArray *imageNewArray=[[NSMutableArray alloc]init];
    for (int i=0;i<ImageArray.count;i++){
        NSString *strImg=[ImageArray objectAtIndex:i];
        [imageNewArray addObject:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/home/%@",strImg]];
    }
    return imageNewArray;
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    return UIViewContentModeScaleAspectFill;
}

- (NSString *) captionForImageAtIndex:(NSUInteger)index inPager:(KIImagePager *)pager
{
    return @[
             @"",
             @"",
             @""
             ][index];
}

#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
   // NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    //NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *cellIdentifier=@"HorizontalCollection";
//    __weak HorizontalCollection *productListCell=(HorizontalCollection *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
//    
//    
//   // NSDictionary *dictObj=[ImageArray objectAtIndex:indexPath.row];
//    
//    [productListCell.imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/home/%@",[ImageArray objectAtIndex:indexPath.row%ImageArray.count]]]  placeholderImage:[UIImage imageNamed:@"stub_image"]];
//    
////    UIView *newhalf = [[UIView alloc] initWithFrame:CGRectMake(-[Constant returnWidth]*0.133, (productListCell.frame.size.height/2)-([Constant returnWidth]*0.133), [Constant returnWidth]*0.133,[Constant returnWidth]*0.133 )];
////    newhalf.alpha = 0.25;
//   
//    productListCell.viewhalf .layer.cornerRadius = [Constant returnWidth]*0.1;
//    productListCell.viewSecondhalf .layer.cornerRadius = [Constant returnWidth]*0.1;
//   // newhalf.backgroundColor = [UIColor blackColor];
//    //[productListCell.viewhalf setHidden:true];
//    //[productListCell addSubview:newhalf];
//   
//   
//    [productListCell.btnNext addTarget:self action:@selector(Next:) forControlEvents:UIControlEventTouchUpInside];
//    [productListCell.btnPrevious addTarget:self action:@selector(Previous:) forControlEvents:UIControlEventTouchUpInside];
//     return productListCell;
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 1000;
//    
//}
//-(HorizontalCollection*)getCell:(UIButton*)btn{
//    UIView *view = [btn superview];
//    while (![view isKindOfClass:[HorizontalCollection class]]) {
//        view = [view superview];
//    }
//    
//    return (HorizontalCollection*)view;
//}
//- (void)Previous:(id)sender {
//    UIButton *btn=(UIButton*)sender;
//    HorizontalCollection *hc=[self getCell:btn];
//    NSIndexPath *currentSelection = [_collectionView indexPathForCell:hc];
//    if(currentSelection.row-1<0){
//        pageControl.currentPage = ImageArray.count-1;
//        currentSelection = [NSIndexPath indexPathForRow:ImageArray.count-1 inSection:currentSelection.section];
//        
//    }
//    else{
//        pageControl.currentPage = currentSelection.row-1;
//        currentSelection = [NSIndexPath indexPathForRow:currentSelection.row-1 inSection:currentSelection.section];
//    }
//    
//    [self.collectionView scrollToItemAtIndexPath:currentSelection atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//}
//- (void)Next:(id)sender {
//    UIButton *btn=(UIButton*)sender;
//    HorizontalCollection *hc=[self getCell:btn];
//    NSIndexPath *currentSelection = [_collectionView indexPathForCell:hc];
//    //CGFloat pageWidth = self.collectionView.frame.size.width;
//    if(currentSelection.row+1>=ImageArray.count){
//        pageControl.currentPage = 0;
//        currentSelection = [NSIndexPath indexPathForRow:0 inSection:currentSelection.section];
//
//    }
//    else{
//    pageControl.currentPage = currentSelection.row+1;
//     currentSelection = [NSIndexPath indexPathForRow:currentSelection.row+1 inSection:currentSelection.section];
//    }
//    [self.collectionView scrollToItemAtIndexPath:currentSelection atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//}
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    //CGFloat pageWidth = self.collectionView.frame.size.width;
//    [self centerIfNeeded:scrollView];
//}
//-(void) centerIfNeeded:(UIScrollView *)scrollView {
//    CGPoint currentOffset = scrollView.contentOffset;
//    CGPoint contentOffset;
//    CGFloat centerX = (scrollView.contentSize.width - scrollView.bounds.size.width) / 2;
//    CGFloat distFromCenter = centerX - currentOffset.x;
//    if (fabs(distFromCenter) > (ImageArray.count*[Constant returnWidth] / 4)) {
//        CGFloat cellcount = distFromCenter / [Constant returnWidth];
//        CGFloat shiftCells;
//        if(cellcount > 0)  shiftCells= floor(cellcount);
//        else shiftCells=ceil(cellcount);
//        
//        CGFloat offsetCorrection = (fabs(cellcount)) * [Constant returnWidth];
//        if (centerX > scrollView.contentOffset.x) {
//            contentOffset = CGPointMake(centerX - offsetCorrection,currentOffset.y);
//        } else {
//            contentOffset = CGPointMake(centerX + offsetCorrection,currentOffset.y);
//        }
//        int offset =[self correctedIndex:shiftCells];
//        indexOffset += offset;
//       // reloadData()
//    }
//    CGPoint centerPoint = CGPointMake(scrollView.frame.size.width / 2 + scrollView.contentOffset.x,scrollView.frame.size.height / 2 + scrollView.contentOffset.y);
//    NSIndexPath *currentSelection =[self.collectionView indexPathForItemAtPoint:centerPoint];
//   // int pageIndex = [self correctedIndex:(currentSelection.row - indexOffset)];
//    //infiniteDelegate?.scrollView?(scrollView, pageIndex: pageIndex)
//    NSLog(@"%d",currentSelection.row);
////    if(pageIndex<0){
////        pageControl.currentPage = ImageArray.count-1;
////        currentSelection = [NSIndexPath indexPathForRow:ImageArray.count-1 inSection:currentSelection.section];
////        
////    }
////    else{
////        pageControl.currentPage = currentSelection.row-1;
////        currentSelection = [NSIndexPath indexPathForRow:currentSelection.row-1 inSection:currentSelection.section];
////    }
//    
//    [self.collectionView scrollToItemAtIndexPath:currentSelection atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//}
//-(int) correctedIndex:(int) indexToCorrect {
//    int  numberOfItems =ImageArray.count;
//    if (numberOfItems > indexToCorrect && indexToCorrect >= 0) {
//        return indexToCorrect;
//    }
//    float countInIndex = (indexToCorrect) /(numberOfItems);
//    int flooredValue = (floor(countInIndex));
//    int offset = numberOfItems * flooredValue;
//    return indexToCorrect - offset;
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CGSize mElementSize = CGSizeMake([Constant returnWidth], [Constant returnHeight]*0.3);
//    
//    return mElementSize;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}
-(void)showRefCode{
    [actionBar removeFromSuperview];
    //[viewButton setHidden:true];
    [tblView setHidden:false];
    [viewRefferalCode setHidden:false];
    [tempActionBar setHidden:false];
    [tblcity setHidden:TRUE];
    [viewRefCode setHidden:false];
    
}
-(void)showHomeScreen{
    if(![UserDefults isRefferalCodeshown]) { // Set tap.
        [UserDefults saveRefferalCodeStatus:YES];
        [self showRefCode];
    }else{
        [self showHideViews:false];
    }
    productArray =[[NSArray alloc]initWithObjects:@"Kitchen",@"Drawing",@"Bathroom",nil];
    ImageArray =[[NSArray alloc]initWithObjects:@"kitchen.jpg",@"Drawing.jpg",@"Bathroom.jpeg",nil];
    [tblView registerNib:[UINib nibWithNibName:@"HomeMenuCell" bundle:nil] forCellReuseIdentifier:@"HomeMenuCell"];
    [tblView reloadData];
}
-(void)getCity{
    //http://qa.ceramicskart.com/api/Product/Type/floor/Mumbai
    
    [[WebServiceController sharedInstance]GetMethod:self url:@"getcities" isSync:true parameters:
     nil response:^(id dictObj) {
         if([[dictObj objectForKey:@"status"]boolValue]){
             data=[dictObj objectForKey:@"data"];
             [tblcity reloadData];
         }
     }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return productArray.count;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(IBAction)editreferalCode:(id)sender{
    UITextField *txtfield=(UITextField*)sender;
    if(txtfield==txtRefralCode){
        if([txtfield.text length]>=30){
            NSString *rechargeAmount=[txtfield.text substringToIndex:30];
            [txtRefralCode setText:rechargeAmount];
       }
    }
}
-(IBAction)okCode:(id)sender{
    [txtRefralCode resignFirstResponder];
}
-(IBAction)wallTiles:(id)sender{
  WallVC *wall=  [[WallVC alloc]initWithNibName:@"WallVC" bundle:nil];
    [self.navigationController pushViewController:wall animated:YES];
}
-(IBAction)floorTiles:(id)sender{
   FloorVC *floor= [[FloorVC alloc]initWithNibName:@"FloorVC" bundle:nil];
    [self.navigationController pushViewController:floor animated:YES];
    
}
-(IBAction)cancelCode:(id)sender{
    [txtRefralCode resignFirstResponder];
    [self showHideViews:false];
}
-(void)showHideViews:(BOOL)showRefferalCode{
   // [viewButton setHidden:showRefferalCode];
    [tblView setHidden:showRefferalCode];
    [viewRefferalCode setHidden:!showRefferalCode];
    [tempActionBar setHidden:true];
    [tblcity setHidden:TRUE];
    [viewRefCode setHidden:true];
    if(!showRefferalCode){
    actionBar=[[ActionBar alloc]init:@"CeramicsKart" callingView:self];
    [self.view addSubview:actionBar];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan)    {
        [self showHideViews:false];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==tblView){
//        let itemToShow = dataSource[indexPath.row % dataSource.count]
//        let cell = UICollectionViewCell() // setup cell with your item and return
    HomeMenuCell *homeMenuCell=[tableView dequeueReusableCellWithIdentifier:@"HomeMenuCell"];
    homeMenuCell.lblProductName.text=[productArray objectAtIndex:indexPath.row];
    [homeMenuCell.imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/home/%@",[ImageArray objectAtIndex:indexPath.row]]]  placeholderImage:[UIImage imageNamed:@"stub_image"]];
       [homeMenuCell.viewBack setBackgroundColor:[UIColor whiteColor]];
     
    homeMenuCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return homeMenuCell;
    }
    else{
        CityCell *homeMenuCell=[tableView dequeueReusableCellWithIdentifier:@"CityCell"];
        homeMenuCell.lblCity.text=[data objectAtIndex:indexPath.row];
         [homeMenuCell.lblCity setTextColor:[UIColor text_color]];
        [homeMenuCell.viewUnderline setBackgroundColor:[UIColor appColor]];
        homeMenuCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return homeMenuCell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==tblcity){
        [self showHomeScreen];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [Constant returnHeight]*0.3;
}
@end
