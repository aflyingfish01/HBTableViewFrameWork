//
//  HBXibViewController.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBXibViewController.h"
#import "HBTableViewListFrame.h"
#import "HBTestXIBModel.h"
#import "MJRefresh.h"
@interface HBXibViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic ,strong) HBTableViewListFrame *tableViewListFrame;


@end

@implementation HBXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"用xib加载tablview";
    
    [self.view addSubview:self.tableView];
    
    [self loadData];
    
 
    
 
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
    
    HBTestXIBSectionModel *model = [[HBTestXIBSectionModel alloc] init];
    model.itemName = @"第0个分区";
    model.rowArray = self.dataArray;
 
    HBTestXIBSectionModel *model1 = [[HBTestXIBSectionModel alloc] init];
    model1.itemName = @"第1个分区";
    model1.rowArray = self.dataArray;
    
    HBTestXIBSectionModel *model2 = [[HBTestXIBSectionModel alloc] init];
    model2.itemName = @"第2个分区";
    model2.rowArray = self.dataArray;
    
//    HBTableViewSectionModelClass *section = [[HBTableViewSectionModelClass alloc] init];
//    section.rowArray = self.dataArray;
    
    [self.tableViewListFrame updateListWithSectionModels:@[model,model1,model2] dataConfigBlock:^(id cell, id model) {
 
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
        NSLog(@"分区 indexPath.secion %ld,行indexPath.row %ld",indexPath.section,indexPath.row);
    }];
    
}

//- (void)dataArrayFormart{
//    NSMutableArray *array = [HBTestXIBModel requestTableDataSource:self.dataArray  rowHeight:150 className:@"HBXIBTableViewCell" isNib:YES ];
//
//    self.dataSource = [HBTableViewDataSource dataSourceViewModel:array dataConfigBlock:^(id cell, id model) {
//
//    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
//        NSLog(@"=====分割线========\n%ld行",indexPath.row);
//    }];
//
//
//}
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

- (HBTableViewListFrame *)tableViewListFrame{
    if (!_tableViewListFrame) {
        _tableViewListFrame = [HBTableViewListFrame tableViewListFrame:self.tableView] ;
    }
    return _tableViewListFrame;
}
@end
