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

@interface HomeViewController ()<UITableViewDelegate,UITextFieldDelegate>{
    IBOutlet UITableView *tblView;
    IBOutlet UITextField *txtRefralCode;
    NSArray *productArray,*ImageArray;
    IBOutlet UIView *viewButton,*viewRefferalCode,*tempActionBar;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AppDelegate *appDelegate=DELEGATE;
    appDelegate.holderStack=[[NSMutableArray alloc]init];
    [appDelegate.holderStack addObject:self];
    
    if(![UserDefults isRefferalCodeshown]) { // Set tap.
       // [self showHideViews:true];
        [UserDefults saveRefferalCodeStatus:YES];
    }else{
        [self showHideViews:false];
    }
    
    productArray =[[NSArray alloc]initWithObjects:@"Kitchen",@"Drawing",@"Bathroom",nil];
    ImageArray =[[NSArray alloc]initWithObjects:@"kitchen.jpg",@"Drawing.jpg",@"Bathroom.jpeg",nil];
     [tblView registerNib:[UINib nibWithNibName:@"HomeMenuCell" bundle:nil] forCellReuseIdentifier:@"HomeMenuCell"];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(menuStateEventOccurred:)
//                                                 name:MFSideMenuStateNotificationEvent
//                                               object:nil];
    [tblView reloadData];
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
    [self showHideViews:false];
}
-(void)showHideViews:(BOOL)showRefferalCode{
    [viewButton setHidden:showRefferalCode];
    [tblView setHidden:showRefferalCode];
    [viewRefferalCode setHidden:!showRefferalCode];
    [tempActionBar setHidden:true];
    if(!showRefferalCode){
    ActionBar *actionBar=[[ActionBar alloc]init:@"Ceramics" callingView:self];
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
    HomeMenuCell *homeMenuCell=[tableView dequeueReusableCellWithIdentifier:@"HomeMenuCell"];

    homeMenuCell.lblProductName.text=[productArray objectAtIndex:indexPath.row];

    [homeMenuCell.imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/home/%@",[ImageArray objectAtIndex:indexPath.row]]]  placeholderImage:[UIImage imageNamed:@"stub_image"]];
       [homeMenuCell.viewBack setBackgroundColor:[UIColor whiteColor]];
    homeMenuCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return homeMenuCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
