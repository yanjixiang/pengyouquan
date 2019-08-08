//
//  TableViewCell.h
//  TableviewLayout
//

#import <UIKit/UIKit.h>
#import "UILabel+MCLabel.h"
#import "YjxCustomModel.h"
#import "YjxToolBarView.h"

NS_ASSUME_NONNULL_BEGIN
@class YjxCustomTableViewCell;

@protocol YjxCustomTableViewCellDelegate <NSObject>
/**
 *  折叠按钮点击代理
 *
 *  @param cell 按钮所属cell
 */
- (void)clickFoldLabel:(YjxCustomTableViewCell *)cell;

@end

@interface YjxCustomTableViewCell : UITableViewCell

//@property (nonatomic,strong)NSDictionary *dataModel;
@property(nonatomic, strong)UIImageView *iconImg;
@property(nonatomic, strong)UILabel *nameL;
@property(nonatomic, strong)UILabel *textContentL;
@property(nonatomic, strong)UILabel *timeL;
@property(nonatomic, strong)UILabel *personalLibL;
@property (nonatomic,strong)UICollectionView *collectView;
@property (nonatomic,strong)UIView *line;
@property(nonatomic, strong)UIButton *moreBtn;
@property (nonatomic, weak) id<YjxCustomTableViewCellDelegate> cellDelegate;

//底部工具栏
@property(nonatomic, strong)YjxToolBarView *toolbar;
@property(nonatomic, strong)YjxCustomModel *model;

//是否需要收起、全文
@property(nonatomic, assign)BOOL isShowFoldBtn;
@end

NS_ASSUME_NONNULL_END
