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

@interface HomeViewController ()<UITableViewDelegate>{
    IBOutlet UITableView *tblView;
    NSArray *productArray,*ImageArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ActionBar *actionBar=[[ActionBar alloc]init:@"Ceramics" callingView:self];
     [self.view addSubview:actionBar];
    
    AppDelegate *appDelegate=DELEGATE;
    appDelegate.holderStack=[[NSMutableArray alloc]init];
    [appDelegate.holderStack addObject:self];
    
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeMenuCell *homeMenuCell=[tableView dequeueReusableCellWithIdentifier:@"HomeMenuCell"];
//    if(homeMenuCell==nil){
//        homeMenuCell=[[HomeMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeMenuCell"];
//    }
    homeMenuCell.lblProductName.text=[productArray objectAtIndex:indexPath.row];
   
//    [homeMenuCell.imgView  setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.ceramicskart.com/img/home/%@",[ImageArray objectAtIndex:indexPath.row]]]] placeholderImage:[UIImage imageNamed:@"stub_merchandise"] success:^(NSURLRequest *request,   NSHTTPURLResponse *response, UIImage *image) {
//        if (homeMenuCell!=NULL)
//        {
//            homeMenuCell.imageView.image = image;
//            [homeMenuCell setNeedsLayout];
//        }
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
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
