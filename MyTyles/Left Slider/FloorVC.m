//
//  FloorVC.m
//  MyTyles
//
//  Created by Martand Joshi on 12/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "FloorVC.h"
#import "ActionBar.h"

@interface FloorVC ()

@end

@implementation FloorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ActionBar *actionBar=[[ActionBar alloc]init:@"Floor" callingView:self];
    [self.view addSubview:actionBar];
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
