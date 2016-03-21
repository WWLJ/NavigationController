//
//  HiddenNavViewController.m
//  NavController_master
//
//  Created by YiTie on 16/3/21.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "HiddenNavViewController.h"


@interface HiddenNavViewController ()<UITableViewDelegate, UITableViewDataSource>

@property  (nonatomic, retain) UITableView *tableView;

@end

@implementation HiddenNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.view addSubview:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self NavigationBarClear:self.navigationController.navigationBar hidden:NO];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self NavigationBarClear:self.navigationController.navigationBar hidden:YES];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
}

#pragma mark ----
#pragma mark privateMethods
-(void)NavigationBarClear:(UINavigationBar *)navigationBar hidden:(BOOL) hidden
{
    if ([navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list = navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                imageView.hidden = hidden;
            }
        }
    }
    
}


#pragma mark ----
#pragma mark scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIColor *color=[UIColor redColor];
    CGFloat offset=scrollView.contentOffset.y;
    self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    if (offset< 0) {
        self.navigationController.navigationBar.backgroundColor = [color colorWithAlphaComponent:1];
    }else{
        CGFloat alpha = offset / 200;
        if (alpha < 0.5) {
            self.navigationController.navigationBar.backgroundColor = [color colorWithAlphaComponent:0];
        }
    }
}


#pragma mark -----
#pragma mark tableView的协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 49;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第  %ld   行", indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


#pragma mark --------
#pragma mark 懒加载
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end
