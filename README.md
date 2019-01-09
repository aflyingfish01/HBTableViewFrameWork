# HBTableViewFrameWork
快速搭建tableView

导入
#import "HBTableViewDataSource.h"
#import "NSObject+HBTableDataModel.h"
 
初始化
> NSMutableArray *array = [HBTestXIBModel requestTableDataSource:self.dataArray  rowHeight:150 className:@"HBXIBTableViewCell" isNib:YES ];
    
    self.dataSource = [HBTableViewDataSource dataSourceViewModel:array dataConfigBlock:^(id cell, id model) {
        
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
        NSLog(@"=====分割线========\n%ld行",indexPath.row);
    }];
    
    
    self.dataArray 是你自身的数据源列表
    
    //绑定代理
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    
    tableView的代理协议都不需要写了
    
    
