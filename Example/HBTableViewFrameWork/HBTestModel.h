//
//  HBTestModel.h
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTableViewSectionModelClass.h"
NS_ASSUME_NONNULL_BEGIN

@interface HBTestModel : HBTableViewCellModelClass

@property(nonatomic, copy) NSString *titleName;

@property(nonatomic, copy) NSString *detail;
@end

NS_ASSUME_NONNULL_END
