//
//  HBTableViewBaseModel.m
//  HBTableViewFrameWork_Example
//
//  Created by hbzq on 2019/1/16.
//  Copyright © 2019 hulailin. All rights reserved.
//

#import "HBTableViewSectionModelClass.h"

@implementation HBTableViewCellModelClass
@synthesize cellReusable,rowHeight,isNib;


@end


@implementation HBTableViewSectionModelClass
@synthesize viewHeaderClass,nibHeaderName,viewFooterClass,nibFooterName,sectionHeaderHeight,sectionFooterHeight,rowArray = _rowArray;

- (NSMutableArray *)rowArray{
    if (!_rowArray) {
        _rowArray =[NSMutableArray array];
    }return _rowArray;
}
@end



