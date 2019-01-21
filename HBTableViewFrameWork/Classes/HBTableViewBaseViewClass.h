//
//  HBTableViewBaseViewClass.h
//  HBTableViewFrameWork
//
//  Created by hbzq on 2019/1/17.
//

#import <UIKit/UIKit.h>
#import "HBTableViewBaseViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface HBTableViewBaseViewClass : UIView<HBTableViewBaseViewProtocol>
 
+ (instancetype)createViewWithNibName:(NSString *)nibName className:(NSString *)className;
@end


@interface HBTableViewBaseCell : UITableViewCell<HBTableViewBaseCellProtocol>


@end

NS_ASSUME_NONNULL_END
