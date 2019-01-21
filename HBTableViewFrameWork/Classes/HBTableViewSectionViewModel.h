//
//  HBTableDataModel.h
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HBTableViewSectionViewModelProtocol.h"

@interface HBTableViewCellViewModel: NSObject<HBTableViewCellModelViewProtocol>

@end

#pragma mark - mark HBTableViewSectionViewModel

@interface HBTableViewSectionViewModel: NSObject<HBTableSectionModelViewProtocol>

@end
