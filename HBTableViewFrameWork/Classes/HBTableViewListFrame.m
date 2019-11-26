//
//  HBTableViewListFrame.m
//  HBTableViewFrameWork
//
//  Created by hbzq on 2019/1/15.
//

#import "HBTableViewListFrame.h"
#import "HBTableViewSectionViewModel.h"
#import "HBTableViewBaseViewClass.h"
#import "HBTableViewDataSource.h"

/**
 配置cell的数据

 @param cell cell
 @param model model
 */
typedef void (^configCellBlock)(id cell, id model);

/**
 cell 点击的响应事件
 
 @param tableView 表
 @param indexPath path
 @param rowData 数据
 */
typedef  void(^didSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);

@interface HBTableViewListFrame()
@property (nonatomic, strong) HBTableViewDataSource *dataSource;
@property (nonatomic, weak) UITableView *tableView;

/** 填充数据的block*/
@property (nonatomic,copy) configCellBlock configBlock;

/** 响应事件*/
@property (nonatomic ,copy) didSelectRowAtIndexPath didSelectRowAtIndexPath;

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
    self.dataSource.modelViewArray = [self requestTableDataArray:dataArray];
    self.configBlock = block;
    self.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
    [self.tableView reloadData];
}
- (void)updateListWithSectionModels:(id)dataArray dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath{
    self.dataSource.modelViewArray = [self requestTableSectionDataArray:dataArray];
    self.configBlock = block;
    self.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
    [self.tableView reloadData];
}

//数组的数据整理
- (NSMutableArray *)requestTableDataArray:(id)dataArray{
    NSMutableArray *array = [NSMutableArray array];
    HBTableViewSectionViewModel *sectionModel =[[HBTableViewSectionViewModel alloc] init];
    NSMutableArray *list = (NSMutableArray *)dataArray;
    [list enumerateObjectsUsingBlock:^(id <HBTableViewCellModelProtocol>   _Nonnull objRow, NSUInteger idx, BOOL * _Nonnull stop) {
        
        HBTableViewCellViewModel *cellModel = [[HBTableViewCellViewModel alloc] init];
        [cellModel setClassName:objRow.cellReusable];
        [cellModel setConfigRowHeight:^CGFloat(NSIndexPath *indexPath) {
            return objRow.rowHeight;
        }];
        [cellModel setIsNib:objRow.isNib];
        [cellModel setConfigCellData:^(id<HBTableViewBaseCellProtocol> cell, id<HBTableViewCellModelProtocol> cellModel) {
            //绑定数据源 如果响应方法 说明继承了基类 系统自动实现方法
            if ([cell respondsToSelector:@selector(updateWithCellData:)]) {
                [cell updateWithCellData:cellModel];
               
            }
            //这个block是cel的回调 用来自定义
            if (self.configBlock) {
                self.configBlock(cell,cellModel);
            }
  
        }];
        [cellModel setDidSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath, id  _Nonnull rowData) {
            if (self.didSelectRowAtIndexPath) {
                self.didSelectRowAtIndexPath(tableView,indexPath,rowData);
            }
        }];
        
        cellModel.rowData = objRow;
        [sectionModel.rowDataArray addObject:cellModel];
    }];
    [array addObject:sectionModel];
    
    return array;
}
//二维数组的数据整理
- (NSMutableArray *)requestTableSectionDataArray:(id)dataArray {
    
    NSMutableArray *sectionModels = [NSMutableArray array];
    
    NSMutableArray *list = (NSMutableArray *)dataArray;
    __weak typeof(self)weakSelf = self;
    [list enumerateObjectsUsingBlock:^(id<HBTableViewSectionModelProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf)self = weakSelf;
        HBTableViewSectionViewModel *sectionModel =[[HBTableViewSectionViewModel alloc] init];
        
        [sectionModel setConfigSectionHeaderHeight:^CGFloat(NSInteger section) {
            return obj.sectionHeaderHeight ? obj.sectionHeaderHeight:0.f;
        }];
        [sectionModel setConfigSectionHeaderView:^id <HBTableViewBaseViewProtocol> (UITableView *tableView, NSInteger section) {
            return  [self configHeaderView:tableView section:section obj:obj];
        }];
        [sectionModel setConfigSectionHeaderData:^(UITableView *tableView, NSInteger section, id<HBTableViewBaseViewProtocol> view, id<HBTableViewSectionModelProtocol> sectionData) {
            [self configHeaderData:tableView section:section headerView:view sectionData:sectionData];
        }];
        
        [sectionModel setConfigSectionFooterHeight:^CGFloat(NSInteger section) {
            return obj.sectionFooterHeight ? obj.sectionFooterHeight:0;
        }];
        [sectionModel setConfigFooterView:^id<HBTableViewBaseViewProtocol>(UITableView *tableView, NSInteger section) {
            return [self configFooterView:tableView section:section obj:obj];
        }];
        [sectionModel setConfigSectionFooterData:^(UITableView *tableView, NSInteger section, id<HBTableViewBaseViewProtocol> view, id<HBTableViewSectionModelProtocol> footerData) {
            [self configFooterData:tableView section:section footerView:view footerData:footerData];
        }];
        
        sectionModel.sectionHeaderData = obj;
        sectionModel.sectionFooterData = obj;
        [self requestTableDataArray:obj.rowArray];
        [sectionModels addObject:sectionModel];
    }];
    return sectionModels;
}


#pragma mark - private methods(私有方法)

- (id<HBTableViewBaseViewProtocol>)configHeaderView:(UITableView *)tableView section:(NSInteger)section obj:(id<HBTableViewSectionModelProtocol>)obj{
    id<HBTableViewBaseViewProtocol> headerView = [HBTableViewBaseViewClass createViewWithNibName:obj.nibHeaderName className:obj.viewHeaderClass];
    return headerView;
}

- (void)configHeaderData:(UITableView *)tableView section:(NSInteger)section headerView:(id<HBTableViewBaseViewProtocol>)headerView sectionData:(id<HBTableViewSectionModelProtocol>)sectionData{
    [headerView fillData:sectionData];
}


- (id<HBTableViewBaseViewProtocol>)configFooterView:(UITableView *)tableView section:(NSInteger)section obj:(id<HBTableViewSectionModelProtocol>)obj{
    id<HBTableViewBaseViewProtocol> footerView = [HBTableViewBaseViewClass createViewWithNibName:obj.nibFooterName className:obj.viewHeaderClass];
    return footerView;
}
- (void)configFooterData:(UITableView *)tableView section:(NSInteger)section footerView:(id<HBTableViewBaseViewProtocol>)footerView footerData:(id<HBTableViewSectionModelProtocol>)footerData{
    [footerView fillData:footerData];
}
#pragma mark - getters and setters

- (HBTableViewDataSource *)dataSource{
    if (!_dataSource) {
        _dataSource = [[HBTableViewDataSource alloc] init];
    }
    return _dataSource;
}
@end
