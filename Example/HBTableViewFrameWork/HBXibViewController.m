//
//  HBXibViewController.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBXibViewController.h"
#import "HBTableViewDataSource.h"
#import "NSObject+HBTableDataModel.h"
#import "HBTestXIBModel.h"
@interface HBXibViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;

@property (nonatomic ,strong) HBTableViewDataSource *dataSource;

@end

@implementation HBXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"用xib加载tablview";
    
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
    HBTestXIBModel *test01 = [[HBTestXIBModel alloc] init];
    test01.titleName =@"用代码加载cell";
    test01.detail =@"第一条测试数据副标题";
    
    HBTestXIBModel *test02 = [[HBTestXIBModel alloc] init];
    test02.titleName =@"用xib加载cell";
    test02.detail =@"第二条测试数据副标题";
    
    HBTestXIBModel *test03 = [[HBTestXIBModel alloc] init];
    test03.titleName =@"这是第三条测试数据";
    test03.detail =@"第三条测试数据副标题";
    
    HBTestXIBModel *test04 = [[HBTestXIBModel alloc] init];
    test04.titleName =@"这是第四条测试数据";
    test04.detail =@"第四条测试数据副标题";
    
 
    
    self.dataArray = @[test01,test02,test03,test04 ].mutableCopy;
}

- (void)dataArrayFormart{
    NSMutableArray *array = [HBTestXIBModel requestTableDataSource:self.dataArray  rowHeight:150 className:@"HBXIBTableViewCell" isNib:YES ];
    
    self.dataSource = [HBTableViewDataSource dataSourceViewModel:array dataConfigBlock:^(id cell, id model) {
        
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
        NSLog(@"=====分割线========\n%ld行",indexPath.row);
    }];
    
    
}
#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,  0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        
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
