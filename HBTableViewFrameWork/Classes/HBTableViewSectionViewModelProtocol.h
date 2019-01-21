//
//  HBTableViewSectionViewModelProtocol.h
//  HBTableViewFrameWork_Example
//
//  Created by hbzq on 2019/1/16.
//  Copyright © 2019 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBTableViewSectionModelProtocol.h"
#import "HBTableViewBaseViewProtocol.h"
typedef NSString *(^configCellIdentifier)(UITableView *tableView,NSIndexPath *indexPath);
typedef CGFloat (^configRowHeight)(NSIndexPath *indexPath);
typedef void(^configCellData)(id<HBTableViewBaseCellProtocol>cell,id<HBTableViewCellModelProtocol>cellModel);
typedef void(^didSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);
@protocol HBTableViewCellModelViewProtocol<NSObject>

/** 当前cell的Class,要保证当前aClass名称与当前identifier标识符一致 */
@property (nonatomic ,copy) NSString* className;
/** cell的高度 用block是为了能动态计算cell的高度*/
@property (nonatomic, copy) configRowHeight configRowHeight;
/**  cell的Data赋值*/
@property (nonatomic, copy) configCellData configCellData;
/** 点击响应 */
@property (nonatomic, copy) didSelectRowAtIndexPath didSelectRowAtIndexPath;
/** 是否通过nib加载cell，默认为NO isNib */
@property (nonatomic) BOOL isNib;
/** cell填充数据 */
@property (nonatomic, strong) id<HBTableViewCellModelProtocol> rowData;

@end

@protocol HBTableSectionModelViewProtocol<NSObject>
typedef CGFloat(^configSectionHeaderHeight)(NSInteger section);
typedef id <HBTableViewBaseViewProtocol>(^configSectionHeaderView)(UITableView *tableView,NSInteger section);
typedef CGFloat(^configSectionFooterHeight)(NSInteger section);
typedef id <HBTableViewBaseViewProtocol>(^configSectionFooterView)(UITableView *tableView,NSInteger section);



#pragma mark - 分区视图2个属性必须配置，否则不显示
/** 分区头视图高度 configSectionHeaderHeight*/
@property (nonatomic, copy) configSectionHeaderHeight configSectionHeaderHeight;
/** 分区头视图 configSectionHeaderView*/
@property (nonatomic, strong) configSectionHeaderView configSectionHeaderView;

#pragma mark - 分区视图2个属性必须配置，否则不显示
/** 分区尾视图高度 configSectionFooterHeight*/
@property (nonatomic, copy) configSectionFooterHeight configSectionFooterHeight;
/** 分区尾视图 configFooterView*/
@property (nonatomic, strong) configSectionFooterView configFooterView;
/** 分区头部头部视图数据 sectionHeaderData*/
@property (nonatomic, strong) id< HBTableViewSectionModelProtocol> sectionHeaderData;
/** 分区尾部视图数据 sectionFooterData*/
@property (nonatomic, strong) id< HBTableViewSectionModelProtocol> sectionFooterData;
/** 更新头视图数据 sectionFooterData*/
@property (nonatomic, strong) void(^configSectionHeaderData)(UITableView *tableView,NSInteger section,id<HBTableViewBaseViewProtocol>view, id< HBTableViewSectionModelProtocol>sectionData);
/** 更新尾视图数据 sectionFooterData*/
@property (nonatomic, strong) void(^configSectionFooterData)(UITableView *tableView,NSInteger section,id<HBTableViewBaseViewProtocol>view, id< HBTableViewSectionModelProtocol>footerData);
/** 分区内的数据模型 rowDataArray*/
@property (nonatomic, strong) NSMutableArray <id<HBTableViewCellModelViewProtocol>>*rowDataArray;
@end
