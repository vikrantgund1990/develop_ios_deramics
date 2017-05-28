//
//  Products.m
//  Ceramics
//
//  Created by Martand Joshi on 28/05/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "Products.h"
#import "ActionBar.h"
#import "WallVC.h"
#import "FloorVC.h"
#import "UIColor+commonColor.h"
@interface Products ()

@end

@implementation Products

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ActionBar *actionBar=[[ActionBar alloc]init:@"Products" callingView:self];
    [self.view addSubview:actionBar];
    
    //[viewInside setBackgroundColor:[UIColor whiteColor]];
    viewInside.layer.cornerRadius=5.0;
    viewInside.layer.borderColor=[[UIColor text_color] CGColor];
    viewInside.layer.borderWidth=1.0f;
   
//    viewBox.layer.borderColor=[UIColor maxGrayDarkColor].CGColor;
//    
//    [viewBox setBackgroundColor:[UIColor whiteColor]];
}
-(IBAction)wallTiles:(id)sender{
    WallVC *wall=  [[WallVC alloc]initWithNibName:@"WallVC" bundle:nil];
    [self.navigationController pushViewController:wall animated:YES];
}
-(IBAction)floorTiles:(id)sender{
    FloorVC *floor= [[FloorVC alloc]initWithNibName:@"FloorVC" bundle:nil];
    [self.navigationController pushViewController:floor animated:YES];
    
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

@end
