//
//  ViewController.m
//  TableviewImageMagnify-demo
//
//  Created by 黄海燕 on 16/9/8.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+TwitterCover.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIView *topView;
}
@property (nonatomic,strong) UITableView *mTableView;

@end

@implementation ViewController

- (id)initWithTopView:(UIView*)view
{
    self = [super init];
    if (self) {
        topView = view;
    }
    return self;
}

- (void)dealloc
{
    [self.mTableView removeTwitterCoverView];
}

- (UITableView *)mTableView
{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        _mTableView.separatorInset = UIEdgeInsetsZero;
    }
    
    return _mTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.mTableView];
    [self.mTableView addTwitterCoverWithImage:[UIImage imageNamed:@"1.jpg"] withTopView:topView];
    self.mTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, CHTwitterCoverViewHeight + topView.bounds.size.height)];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"indexpath:%d",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
