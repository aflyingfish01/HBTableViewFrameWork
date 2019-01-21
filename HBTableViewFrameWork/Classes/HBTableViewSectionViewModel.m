//
//  HBTableDataModel.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTableViewSectionViewModel.h"


@implementation HBTableViewCellViewModel
@synthesize className,configRowHeight,isNib,configCellData,didSelectRowAtIndexPath,rowData;

@end


@implementation HBTableViewSectionViewModel
@synthesize configSectionHeaderHeight,configSectionHeaderView,sectionHeaderData,configSectionHeaderData,configSectionFooterHeight,configFooterView,sectionFooterData,configSectionFooterData,rowDataArray=_rowDataArray;

- (NSMutableArray *)rowDataArray{
    if (!_rowDataArray) {
        _rowDataArray =[NSMutableArray array];
    }return _rowDataArray;
}
@end

