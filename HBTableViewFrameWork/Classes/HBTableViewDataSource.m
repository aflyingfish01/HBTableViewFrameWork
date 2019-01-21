//
//  HBTableDataSource.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTableViewDataSource.h"
#import "HBTableViewSectionViewModel.h"
#import "HBTableViewBaseViewProtocol.h"
#import "HBTableViewBaseViewClass.h"
@interface HBTableViewDataSource()

@end
@implementation HBTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.modelViewArray) {
        return self.modelViewArray.count;
    }return 0;
}


#pragma mark - tableViewDelegate tableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    id <HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:section];
    return sectionModel.configSectionHeaderHeight?sectionModel.configSectionHeaderHeight(section):0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    id <HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:section];
    return sectionModel.configSectionFooterHeight?sectionModel.configSectionFooterHeight(section):0.01;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    id <HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:section];
    id<HBTableViewBaseViewProtocol> sectionView =nil;
    sectionView = sectionModel.configSectionHeaderView?sectionModel.configSectionHeaderView(tableView,section):( id<HBTableViewBaseViewProtocol>)[[UIView alloc] init];
    if (sectionModel.configSectionHeaderData) {
        sectionModel.configSectionHeaderData(tableView, section, sectionView, sectionModel.sectionHeaderData);
    }
    return (UIView *)sectionView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;{
    id <HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:section];
    id<HBTableViewBaseViewProtocol> footerView =nil;
    footerView = sectionModel.configFooterView?sectionModel.configFooterView(tableView,section):(id<HBTableViewBaseViewProtocol>)[[UIView alloc] init];
    if (sectionModel.configSectionFooterData) {
        sectionModel.configSectionFooterData(tableView, section, footerView, sectionModel.sectionFooterData);
 
    }
    return (UIView *)footerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:section];
    return sectionModel.rowDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
    id<HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:indexPath.section];
    id<HBTableViewCellModelViewProtocol> cellModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellModel.className];
    if (!cell) {
        if(cellModel.isNib){
            cell =[[NSBundle mainBundle] loadNibNamed:cellModel.className owner:nil options:nil][0];
         }else{
            cell = [[NSClassFromString(cellModel.className) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.className];
         }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
 
    if (cellModel.configCellData) {
        cellModel.configCellData((id<HBTableViewBaseCellProtocol>)cell, cellModel.rowData);
    }
 
    return cell;
}

/**
 cell 点击响应f

 @param tableView tableView
 @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id<HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:indexPath.section];
    id<HBTableViewCellModelViewProtocol> rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    if (rowModel.didSelectRowAtIndexPath) {
        rowModel.didSelectRowAtIndexPath(tableView, indexPath, rowModel);
    }
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id<HBTableSectionModelViewProtocol> sectionModel =[self.modelViewArray objectAtIndex:indexPath.section];
    id<HBTableViewCellModelViewProtocol> rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    return rowModel.configRowHeight?rowModel.configRowHeight(indexPath):0;
}
 
@end
