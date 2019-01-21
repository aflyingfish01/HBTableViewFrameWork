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
pod 'HBTableViewFrameWork', '~> 0.1.3'
```
# HBTableViewFrameWork
快速搭建tableView

导入
数据模型继承HBTableViewCellModelClass
实现关键3个方法
- (NSString *)cellReusable{
    return @"HBShortElvesTableViewCell";
}

- (CGFloat)rowHeight{
    return  54.0;
}

- (BOOL)isNib {
    return YES;
}


viewcontroller中初始化
>
- (HBTableViewListFrame *)tableViewList{
    if (!_tableViewList) {
        _tableViewList = [HBTableViewListFrame tableViewListFrame:self.tableView] ;
    }
    return _tableViewList;
}

[self.tableViewList updateListWithModels:self.dataArray dataConfigBlock:^(id  _Nonnull cell, id  _Nonnull model) {
        
    } didSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath, id  _Nonnull rowData) {
        STRONG_SELF;
        HBshortElvesModel *model = [self.dataArray safeObjectAtIndex:indexPath.row];
          [HBHttpTool postSSECode:model.stockCode exchange:model.exchange stockName:model.stockName  followId:nil securityType:model.securityType subType:nil viewController:self];
    }];
    
    tableView的代理协议都不需要写了

## Author

hulailin, 376999818@qq.com

## License

HBTableViewFrameWork is available under the MIT license. See the LICENSE file for more info.
