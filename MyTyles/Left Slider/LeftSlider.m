//
//  LeftSlider.m
//  MyTyles
//
//  Created by Martand Joshi on 11/03/17.
//  Copyright © 2017 MyTyles. All rights reserved.
//

#import "LeftSlider.h"
#import "UIColor+commonColor.h"
@interface LeftSlider ()

@end

@implementation LeftSlider

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor appColor]];
}
-(void)viewDidAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuStateEventOccurred:) name:MFSideMenuStateNotificationEvent object:nil];
}
- (void)menuStateEventOccurred:(NSNotification *)notification {
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
