//
//  RealHiddenViewController.m
//  NavController_master
//
//  Created by YiTie on 16/3/21.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "RealHiddenViewController.h"

@interface RealHiddenViewController ()

@end

@implementation RealHiddenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.view.backgroundColor = [UIColor blueColor];
    [self setUpPopButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}


- (void)setUpPopButton
{
    UIButton *backButton  =[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    backButton.backgroundColor = [UIColor yellowColor];
    [backButton addTarget:self action:@selector(popBackToVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}


- (void)popBackToVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
