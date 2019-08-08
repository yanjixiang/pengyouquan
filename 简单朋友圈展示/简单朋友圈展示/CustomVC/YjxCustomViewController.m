//
//  ViewController.m
//  简单朋友圈展示
//
//  Created by 闫继祥 on 2019/7/17.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "YjxCustomViewController.h"
#import "YjxCustomTableViewCell.h"
#import "Masonry.h"
#import "UIColor+YMHex.h"
@interface YjxCustomViewController ()<UITableViewDelegate,UITableViewDataSource,YjxCustomTableViewCellDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation YjxCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(@0);
        
    }];
    
    [self GetData];
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"--------000-----%f",self.tableView.frame.size.height);
    
}
- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
    
}
- (void)GetData {
    for (int i = 0; i < 10; i ++) {
        YjxCustomModel *model = [[YjxCustomModel alloc] init];
        model.idStr = [NSString stringWithFormat:@"%d",i];
        model.iconImg = @"zhanweitu";
        model.nickname = @"我是昵称";
        model.timeStr = @"2019-09-08";
        model.personal = @"知名博主";
        model.textContent = @"我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我222";
        model.imageArr =  @[@"zhanweitu",@"zhanweitu",@"zhanweitu",@"zhanweitu",@"zhanweitu"];
        if ( i == 0) {
            model.textContent = @"";
        }
        if (i == 1) {
            model.textContent = @"我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我2223333333333339999999999999dadadadadwaudbwabdwadwbadbwauduadowadubwaubdbwadwabdaw";
        }
        [self.dataSource addObject:model];
    }
    
}
#pragma mark
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    YjxCustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell) {
        cell = [[YjxCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = NO;
    YjxCustomModel *model = self.dataSource[indexPath.row];
    cell.cellDelegate = self;
    cell.model = model;
    
    return cell;
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //高度自适应
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        _tableView.estimatedRowHeight = 50;
        
    }
    
    return _tableView;
    
}
-(void)clickFoldLabel:(YjxCustomTableViewCell *)cell{
    
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    YjxCustomModel *model = self.dataSource[indexPath.row];
    model.isShowMore = !model.isShowMore;
    [UIView setAnimationsEnabled:NO];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    [UIView setAnimationsEnabled:YES];

}

@end
