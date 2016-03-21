//
//  ViewController.m
//  NavController_master
//
//  Created by YiTie on 16/3/21.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "ViewController.h"
#import "TransparentViewController.h"
#import "HiddenNavViewController.h"
#import "TranSecondViewController.h"
#import "HiddenNavSecondViewController.h"
#import "RealHiddenViewController.h"
#import "NavAnimateViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>


@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)NSMutableArray *dateSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"主页";
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    self.navigationController.navigationBarHidden = NO;
}


#pragma mark -----
#pragma mark tableView的协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dateSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.dateSource objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            TransparentViewController *tranVC = [[TransparentViewController alloc] init];
            [self.navigationController pushViewController:tranVC animated:YES];
        }
            break;
        case 1:{
            TranSecondViewController *secondVC = [[TranSecondViewController alloc] init];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
        case 2:{
            HiddenNavViewController *hiddenVC = [[HiddenNavViewController alloc] init];
            [self.navigationController pushViewController:hiddenVC animated:YES];
        }
            break;
        case 3:{
            HiddenNavSecondViewController *hiddenSecondVC = [[HiddenNavSecondViewController alloc] init];
            [self.navigationController pushViewController:hiddenSecondVC animated:YES];
        }
            break;
        case 4:{
            RealHiddenViewController *realHiddenVC = [[RealHiddenViewController alloc] init];
            [self.navigationController pushViewController:realHiddenVC animated:YES];
        }
            break;
        case 5:{
            NavAnimateViewController *animateVC = [[NavAnimateViewController alloc] init];
            [self.navigationController pushViewController:animateVC animated:YES];
        }
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


-(NSMutableArray *)dateSource
{
    if (!_dateSource) {
        _dateSource = [NSMutableArray array];
        [_dateSource addObject:@"透明的导航栏"];
        [_dateSource addObject:@"透明导航栏二"];
        [_dateSource addObject:@"导航栏随偏移量透明"];
        [_dateSource addObject:@"导航栏随偏移量透明2"];
        [_dateSource addObject:@"隐藏导航栏"];
        [_dateSource addObject:@"仿简书效果"];
    }
    return _dateSource;
}

@end
