//
//  sectionHeaderView.m
//  HBTableViewFrameWork_Example
//
//  Created by hbzq on 2019/1/17.
//  Copyright © 2019 hulailin. All rights reserved.
//

#import "sectionHeaderView.h"
#import "HBTestXIBModel.h"
@implementation sectionHeaderView

-(void)fillData:(id)data{
    HBTestXIBSectionModel* model = ( HBTestXIBSectionModel*)data;
    self.title.text = model.itemName;
}

- (IBAction)btnClick:(id)sender {
    
    NSLog(@"更多按钮点击");
}

@end
