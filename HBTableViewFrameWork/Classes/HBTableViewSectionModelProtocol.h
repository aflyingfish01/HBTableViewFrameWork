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
/** cell重用标示 */
@property (nonatomic, copy) NSString *cellReusable;
/** cell的高度 */
@property (nonatomic, assign) CGFloat rowHeight;
/** isNib */
@property (nonatomic) BOOL isNib;
@end
/** 分区 */
@protocol  HBTableViewSectionModelProtocol <NSObject>
/** 区头 viewHeaderClass */
@property (nonatomic, copy) NSString *viewHeaderClass;
/** 区头 nibHeaderName */
@property (nonatomic, copy) NSString *nibHeaderName;
/** 区尾 viewClass */
@property (nonatomic, copy) NSString *viewFooterClass;
/** 区尾 nibFooterName */
@property (nonatomic, copy) NSString *nibFooterName;
/** 区头部的高度 sectionHeaderHeight*/
@property (nonatomic, assign) CGFloat sectionHeaderHeight;
/** 区尾部的高度 sectionFooterHeight*/
@property (nonatomic, assign) CGFloat sectionFooterHeight;
/** 分区区对应的 rowArray*/
@property (nonatomic, strong) NSMutableArray <id<HBTableViewCellModelProtocol>>*rowArray;
@end


NS_ASSUME_NONNULL_END
