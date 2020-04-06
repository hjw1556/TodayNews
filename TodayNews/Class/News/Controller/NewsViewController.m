//
//  NewsViewController.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * newsTableView;

@end

@implementation NewsViewController

- (instancetype)init{
    self = [super  init];
    if(self){
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"news"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"news_selected"];
        //TODO后续需要添加icon
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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"newsTableViewCell";
    NewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[NewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell layoutTableViewCell];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
