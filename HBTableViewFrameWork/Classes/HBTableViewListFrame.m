//
//  HBTableViewListFrame.m
//  HBTableViewFrameWork
//
//  Created by hbzq on 2019/1/15.
//

#import "HBTableViewListFrame.h"

#import "HBTableViewSectionViewModel.h"

@interface HBTableViewListFrame()
@property (nonatomic, strong) HBTableViewDataSource *dataSource;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation HBTableViewListFrame


+ (instancetype)tableViewListFrame:(UITableView *)tableView{
    HBTableViewListFrame *tableList = [[HBTableViewListFrame alloc] init];
    tableList.tableView = tableView;
    tableView.delegate = tableList.dataSource;
    tableView.dataSource = tableList.dataSource;
    return tableList;
}

- (void)updateListWithModels:(id)dataArray dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath{
 
    self.dataSource.modelViewArray = dataArray;
    self.dataSource.configBlock = block;
    self.dataSource.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
    [self.tableView reloadData];
 
}

#pragma mark - getters and setters

- (HBTableViewDataSource *)dataSource{
    if (!_dataSource) {
        _dataSource = [[HBTableViewDataSource alloc] init];
    }
    return _dataSource;
}
@end
