# HBTableViewFrameWork

[![CI Status](https://img.shields.io/travis/hulailin/HBTableViewFrameWork.svg?style=flat)](https://travis-ci.org/hulailin/HBTableViewFrameWork)
[![Version](https://img.shields.io/cocoapods/v/HBTableViewFrameWork.svg?style=flat)](https://cocoapods.org/pods/HBTableViewFrameWork)
[![License](https://img.shields.io/cocoapods/l/HBTableViewFrameWork.svg?style=flat)](https://cocoapods.org/pods/HBTableViewFrameWork)
[![Platform](https://img.shields.io/cocoapods/p/HBTableViewFrameWork.svg?style=flat)](https://cocoapods.org/pods/HBTableViewFrameWork)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HBTableViewFrameWork is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HBTableViewFrameWork'
```
# HBTableViewFrameWork
快速搭建tableView

导入
#import "HBTableViewDataSource.h"
#import "NSObject+HBTableDataModel.h"
 
初始化
> NSMutableArray *array = [HBTestXIBModel requestTableDataSource:self.dataArray  rowHeight:150 className:@"HBXIBTableViewCell" isNib:YES ];
    
    self.dataSource = [HBTableViewDataSource dataSourceViewModel:array dataConfigBlock:^(id cell, id model) {
        
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
        NSLog(@"=====分割线========\n%ld行",indexPath.row);
    }];
    
    
    self.dataArray 是你自身的数据源列表
    
    //绑定代理
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    
    tableView的代理协议都不需要写了

## Author

hulailin, 376999818@qq.com

## License

HBTableViewFrameWork is available under the MIT license. See the LICENSE file for more info.
