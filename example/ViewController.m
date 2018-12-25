//
//  ViewController.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "ViewController.h"
#import "HBTableViewDataSource.h"
#import "NSObject+HBTableDataModel.h"
#import "HBTestModel.h"
#import "HBXibViewController.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;

@property (nonatomic ,strong) HBTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    [self.view addSubview:self.tableView];
    
    [self loadData];
   
    //转换数据源
    [self dataArrayFormart];
    
    //绑定代理
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
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
    NSMutableArray *array = [HBTestModel requestTableDataSource:self.dataArray  rowHeight:50 className:@"UITableViewCell" isNib:NO];
    
    self.dataSource = [HBTableViewDataSource dataSourceViewModel:array dataConfigBlock:^(id cell, id model) {
        UITableViewCell *cellView =(UITableViewCell *)cell;
        HBTestModel *viewModel = (HBTestModel *)model;
        cellView.textLabel.text = viewModel.titleName;
        cellView.detailTextLabel.text = viewModel.detail;
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
        NSLog(@"=====分割线========\n%ld行",indexPath.row);
        //强弱引用
        __weak typeof(self)weakSelf = self;
 
        if (indexPath.row == 0) {
            
        }else if (indexPath.row == 1){
            HBXibViewController *vc = [[HBXibViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
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
@end
