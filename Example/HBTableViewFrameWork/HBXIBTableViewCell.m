//
//  HBXIBTableViewCell.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBXIBTableViewCell.h"
#import "HBTestXIBModel.h"

@interface HBXIBTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleName;

@end

@implementation HBXIBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)updateWithCellData:(id)aData{
    HBTestXIBModel *model = (HBTestXIBModel *)aData;
    self.titleName.text = model.titleName;
}

@end
