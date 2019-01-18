//
//  HBTestModel.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTestModel.h"

@implementation HBTestModel

- (NSString *)cellReusable{
    return @"UITableViewCell";
}

- (CGFloat)rowHeight{
    return 100;
}

- (BOOL)isNib{
    return NO;
}
@end
