//
//  HBTableViewBaseModel.h
//  HBTableViewFrameWork_Example
//
//  Created by hbzq on 2019/1/16.
//  Copyright © 2019 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HBTableViewSectionModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

/**
 遵守协议的父类
 */
@interface  HBTableViewCellModelClass: NSObject<HBTableViewCellModelProtocol>

@end

@interface  HBTableViewSectionModelClass: NSObject<HBTableViewSectionModelProtocol>

@end

NS_ASSUME_NONNULL_END
