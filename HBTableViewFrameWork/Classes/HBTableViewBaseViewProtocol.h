//
//  HBTableViewSectionViewModelProtocol.h
//  HBTableViewFrameWork_Example
//
//  Created by hbzq on 2019/1/16.
//  Copyright © 2019 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBTableViewSectionModelProtocol.h"
@protocol HBTableViewBaseViewProtocol <NSObject>
- (void)fillData:(id)data;
@end
@protocol HBTableViewBaseCellProtocol <NSObject>

/**
 更新cell数据

 @param aData model
 */
- (void)updateWithCellData:(id<HBTableViewCellModelProtocol>)aData;
@end
