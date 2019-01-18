//
//  HBTestXIBModel.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTestXIBModel.h"
#import "MJRefresh.h"
@implementation HBTestXIBModel

- (NSString *)cellReusable{
    return @"HBXIBTableViewCell";
}


- (CGFloat)rowHeight{
    return 200.0;
}
- (BOOL)isNib{
    return YES;
}

@end


@implementation HBTestXIBSectionModel


- (CGFloat)sectionHeaderHeight{
    return 40;
}

- (NSString *)nibHeaderName{
    return @"sectionHeaderView";
}

- (NSString *)viewHeaderClass{
    return @"sectionHeaderView";
}


- (CGFloat)sectionFooterHeight{
    return 30;
}

- (NSString *)nibFooterName{
    return @"SectionFooterView";
}

@end
