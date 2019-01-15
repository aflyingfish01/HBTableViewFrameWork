//
//  HBTableViewListFrame.h
//  HBTableViewFrameWork
//
//  Created by hbzq on 2019/1/15.
//

#import <Foundation/Foundation.h>
#import "HBTableViewDataSource.h"
NS_ASSUME_NONNULL_BEGIN
 
@interface HBTableViewListFrame : NSObject


+ (instancetype)tableViewListFrame:(UITableView *)tableView;

- (void)updateListWithModels:(id)dataArray dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath;
@end

NS_ASSUME_NONNULL_END
