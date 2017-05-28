//
//  LeftSlider.m
//  MyTyles
//
//  Created by Martand Joshi on 11/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "LeftSlider.h"
#import "UIColor+commonColor.h"
#import "LeftSliderCell.h"
#import "WallVC.h"
#import "FloorVC.h"
#import "Constant.h"
#import "ActionBar.h"
#import "WebViewController.h"
#import "Products.h"

@interface LeftSlider (){
    IBOutlet UITableView *tblView;
    NSArray *tblArray;
}

@end

@implementation LeftSlider

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor appColor]];
    tblArray =[[NSArray alloc]initWithObjects:@"Home",@"Products",@"3D Tile Visualizer",@"Other Products",@"List your Products",@"Contact Us",@"About Us",@"Promotion Code",nil];
    [tblView registerNib:[UINib nibWithNibName:@"LeftSliderCell" bundle:nil] forCellReuseIdentifier:@"LeftSliderCell"];
    [tblView setBackgroundColor:[UIColor whiteColor]];
    [tblView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tblArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftSliderCell *leftSliderCell=[tableView dequeueReusableCellWithIdentifier:@"LeftSliderCell"];
    leftSliderCell.lblTitle.text=[tblArray objectAtIndex:indexPath.row];
    leftSliderCell.selectionStyle=UITableViewCellSelectionStyleNone;
    [leftSliderCell.lblTitle setTextColor:[UIColor text_color]];
    return leftSliderCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [ActionBar leftSliderToggle];
    
    AppDelegate *appDelegateSharedObj=DELEGATE;
    UIViewController *con = [appDelegateSharedObj.holderStack lastObject];
    UIViewController *viewCon;
    
    int option=(int)indexPath.row;
    switch (option) {
        case 0:{
            [Constant ReDirectToHome];
            break;
        }
        case 1:{
           // products
            viewCon=[[Products alloc]initWithNibName:@"Products" bundle:nil];
            break;
        }
        case 7:{
            //Refferal code
            if( [con respondsToSelector:@selector(showRefCode)]){
                
                [con performSelector:@selector(showRefCode)];
            }
            break;
        }
            
        default:{
            viewCon=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
            break;
        }
    }
   [[con navigationController]pushViewController:viewCon animated:YES];
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

-(void)viewDidAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuStateEventOccurred:) name:MFSideMenuStateNotificationEvent object:nil];
}
- (void)menuStateEventOccurred:(NSNotification *)notification {
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
