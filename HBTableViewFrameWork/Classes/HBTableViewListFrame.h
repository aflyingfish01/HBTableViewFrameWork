//
//  HBTableViewListFrame.h
//  HBTableViewFrameWork
//
//  Created by hbzq on 2019/1/15.
//

#import <Foundation/Foundation.h>
 
NS_ASSUME_NONNULL_BEGIN
/**
 配置cell的数据

 @param cell cell
 @param model 模型
 */
typedef void (^configCellBlock)(id cell, id model);

/**
 cell 点击的响应事件
 
 @param tableView 表
 @param indexPath path
 @param rowData 数据
 */
typedef  void(^didSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);

@interface HBTableViewListFrame : NSObject

/**
 初始化框架

 @param tableView tableView
 @return 对象
 */
+ (instancetype)tableViewListFrame:(UITableView *)tableView;

- (void)updateListWithModels:(id)dataArray dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath;

- (void)updateListWithSectionModels:(id)dataArray dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath;
@end

NS_ASSUME_NONNULL_END
