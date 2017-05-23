//
//  ViewController.m
//  YuerGoodsListHeaderView
//
//  Created by XiangTaiMini on 2017/5/22.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import "ViewController.h"
#import "GoodsListHeaderView.h"
#import "GoodsListHeaderViewSetDefault.h"

static const CGFloat headerViewHeight = 50;

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, nullable, strong) UITableView *tableView;
@property (nonatomic, nullable, strong) GoodsListHeaderView *goodsListHeaderView;
@property (nonatomic, nullable, strong) GoodsListHeaderViewSetDefault *goodsListHeaderViewSetDefault;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.goodsListHeaderView];
    [self.view addSubview:self.goodsListHeaderViewSetDefault];
    [self.view addSubview:self.tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    cell.textLabel.text = @"商品列表";
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (GoodsListHeaderView *)goodsListHeaderView{
    
    if (!_goodsListHeaderView) {
        _goodsListHeaderView = [[GoodsListHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, headerViewHeight)];
        _goodsListHeaderView.backgroundColor = [UIColor greenColor];
    }
    return _goodsListHeaderView;
}

- (GoodsListHeaderViewSetDefault *)goodsListHeaderViewSetDefault {
    if (!_goodsListHeaderViewSetDefault) {
        _goodsListHeaderViewSetDefault = [[GoodsListHeaderViewSetDefault alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, headerViewHeight)];
        _goodsListHeaderViewSetDefault.backgroundColor = [UIColor greenColor];
    }
    return _goodsListHeaderViewSetDefault;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        CGRect frame = CGRectMake(0, headerViewHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - headerViewHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
