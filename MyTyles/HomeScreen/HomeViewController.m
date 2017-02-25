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

@interface HomeViewController ()<UITableViewDelegate>{
    IBOutlet UITableView *tblView;
    NSArray *productArray,*ImageArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    productArray =[[NSArray alloc]initWithObjects:@"KitchenTiles",@"KitchenTiles",@"KitchenTiles",@"KitchenTiles",@"KitchenTiles",nil];
     ImageArray =[[NSArray alloc]initWithObjects:@"KitchenTiles",@"KitchenTiles",@"KitchenTiles",@"KitchenTiles",@"KitchenTiles",nil];
     [tblView registerNib:[UINib nibWithNibName:@"HomeMenuCell" bundle:nil] forCellReuseIdentifier:@"HomeMenuCell"];
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
    [homeMenuCell.viewBack setBackgroundColor:[UIColor appColor]];
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
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
