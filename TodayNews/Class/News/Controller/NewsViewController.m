//
//  NewsViewController.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "NewsDetailViewController.h"
#import "NewsDeleteCellView.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,NewTableViewCellDelegate>

@property (nonatomic, strong) UITableView * newsTableView;

@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation NewsViewController

- (instancetype)init{
    self = [super  init];
    if(self){
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 20; i ++) {
            [_dataArray addObject:@(i)];
        }
    
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"news"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"news_selected"];
    }
    return self;
}

#pragma -mark 懒加载
- (UITableView *)newsTableView{
    if(_newsTableView == nil){
        _newsTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _newsTableView.backgroundColor = [UIColor whiteColor];
        _newsTableView.delegate = self;
        _newsTableView.dataSource = self;
    }
    return _newsTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeTableView];
}

- (void)makeTableView{
    [self.view addSubview:self.newsTableView];
}

#pragma -mark UITableView代理实现方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"newsTableViewCell";
    NewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[NewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.delegate = self;
        
    }
    [cell layoutTableViewCell];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDetailViewController * newsDetailVC = [[NewsDetailViewController alloc]init];
    newsDetailVC.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:newsDetailVC animated:YES];

}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
    NewsDeleteCellView * deleteView = [[NewsDeleteCellView alloc]initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    __weak typeof(self) weakSelf = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.newsTableView deleteRowsAtIndexPaths:@[[strongSelf.newsTableView indexPathForCell:tableViewCell]] withRowAnimation: UITableViewRowAnimationAutomatic];
    }];
    
}


@end
