//
//  HBTableViewSectionViewProtocol.h
//  HBTableViewFrameWork_Example
//
//  Created by hbzq on 2019/1/15.
//  Copyright © 2019 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 所有表格类型的模型的协议
 */

@protocol HBTableViewCellModelProtocol <NSObject>
//cell重用标示
@property (nonatomic, copy) NSString *cellReusable;
//cell的高度
@property (nonatomic, strong) NSNumber *rowHeight;
//isNib
@property (nonatomic) BOOL isNib;
@end
//区
@protocol HBTableViewSectionProtocol <NSObject>
//区头viewClass
@property (nonatomic, copy) NSString *viewHeaderClass;
//区头nib name
@property (nonatomic, copy) NSString *nibHeaderName;
//区尾viewClass
@property (nonatomic, copy) NSString *viewFooterClass;
//区尾nib name
@property (nonatomic, copy) NSString *nibFooterName;
//区头部的高度
@property (nonatomic, strong) NSNumber *sectionHeaderHeight;
//区尾部的高度
@property (nonatomic, strong) NSNumber *sectionFooterHeight;
//区对应的rowsdata
@property (nonatomic, strong) NSMutableArray <id<HBTableViewCellModelProtocol>>*rowArray;
@end


NS_ASSUME_NONNULL_END
