//
//  HBTableViewBaseViewClass.m
//  HBTableViewFrameWork
//
//  Created by hbzq on 2019/1/17.
//

#import "HBTableViewBaseViewClass.h"

@implementation HBTableViewBaseViewClass


+ (instancetype)createViewWithNibName:(NSString *)nibName className:(NSString *)className{
    return (HBTableViewBaseViewClass *)[HBTableViewBaseViewClass getNibViewWithNibName:nibName className:className];
}


+ (UIView *)getNibViewWithNibName:(NSString *)nibName className:(NSString *)className{
    if (className != nil) {
        return [[NSClassFromString(className) alloc] init];
    }else if (nibName != nil){
        return [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil][0];
    }
    return nil;
}


- (void)fillData:(id)data{}
@end


@interface HBTableViewBaseCell ()
@property (nonatomic, strong, readwrite) NSIndexPath *indexPath;

@end

@implementation HBTableViewBaseCell

#pragma mark - Live Method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}


#pragma mark - private methods(私有方法)

- (void)updateWithCellData:(id<HBTableViewCellModelProtocol>)aData{}

@end

