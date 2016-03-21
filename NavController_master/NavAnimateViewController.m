//
//  NavAnimateViewController.m
//  NavController_master
//
//  Created by YiTie on 16/3/21.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "NavAnimateViewController.h"

@interface NavAnimateViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    /*
     * 记录scrollew滚动方向的属性
     */
    CGFloat startContentOffsetX;
    CGFloat willEndContentOffsetX;
    CGFloat endContentOffsetX;
}
@property  (nonatomic, retain) UITableView *tableView;

@property (nonatomic, assign)CGFloat currentOffset;

@end

@implementation NavAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"动画效果";
    [self.view addSubview:self.tableView];
}



#pragma mark ----
#pragma mark scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (willEndContentOffsetX > startContentOffsetX) {
        [UIView animateWithDuration:0.5 animations:^{
            //这里可以有一些其他的操作
        } completion:^(BOOL finished) {
            self.navigationController.navigationBarHidden = YES;
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            //这里可以有一些其他的操作
        } completion:^(BOOL finished) {
            self.navigationController.navigationBarHidden = NO;
        }];
    }
    
}
#pragma mark scrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{    //拖动前的起始坐标
    startContentOffsetX = scrollView.contentOffset.y;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{    //将要停止前的坐标
    willEndContentOffsetX = scrollView.contentOffset.y;
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
