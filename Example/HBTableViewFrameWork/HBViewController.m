//
//  HBViewController.m
//  HBTableViewFrameWork
//
//  Created by hulailin on 01/10/2019.
//  Copyright (c) 2019 hulailin. All rights reserved.
//

#import "HBViewController.h"
#import "HBTableViewDataSource.h"
#import "HBTestModel.h"
#import "HBXibViewController.h"
#import "HBTableViewListFrame.h"
#import "MJRefresh.h"
@interface HBViewController ()
@property(strong, nonatomic) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;

 @property(nonatomic, copy) HBTableViewListFrame *tableViewList;
@end

@implementation HBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    [self loadData];
    
    [self.view addSubview:self.tableView];

    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __weak __typeof(self)weakSelf = self;
        [weakSelf.dataArray addObjectsFromArray:self.dataArray];
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf dataArrayFormart];
    }];
//    //转换数据源
    [self dataArrayFormart];
    
 
}


#pragma mark - private methods(私有方法)
- (void)loadData{
    HBTestModel *test01 = [[HBTestModel alloc] init];
    test01.titleName =@"用代码加载cell";
    test01.detail =@"第一条测试数据副标题";
    
    HBTestModel *test02 = [[HBTestModel alloc] init];
    test02.titleName =@"用xib加载cell";
    test02.detail =@"第二条测试数据副标题";
 
    self.dataArray = @[test01,test02].mutableCopy;
 
}

- (void)dataArrayFormart{
    [self.tableViewList updateListWithModels:self.dataArray dataConfigBlock:^(id  _Nonnull cell, id  _Nonnull model) {
        UITableViewCell *cellView =(UITableViewCell *)cell;
        cellView.backgroundColor = [UIColor orangeColor];
        HBTestModel *viewModel = (HBTestModel *)model;
        cellView.textLabel.text = viewModel.titleName;
        cellView.detailTextLabel.text = viewModel.detail;
    } didSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath, id  _Nonnull rowData) {
        __weak typeof(self)weakSelf = self;
        
            HBXibViewController *vc = [[HBXibViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        
    }];

}


#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,  0, self.view.frame.size.width, self.view.frame.size.height)];
        
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (HBTableViewListFrame *)tableViewList{
    if (!_tableViewList) {
        _tableViewList = [HBTableViewListFrame tableViewListFrame:self.tableView];
    }
    return _tableViewList;
}
@end
