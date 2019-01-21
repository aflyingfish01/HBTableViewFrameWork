//
//  HBTableDataSource.h
//  HBListTableControll_Example
//
//  Copyright © 2018年 lishuailibertine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HBTableViewDataSource : NSObject <UITableViewDataSource,UITableViewDelegate>

/**
 存放的是的转化好的框架的模型
 */
@property (nonatomic, strong) NSMutableArray *modelViewArray;

@end
