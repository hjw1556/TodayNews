//
//  VideoViewController.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * videoCollectionView;

@end

@implementation VideoViewController



- (instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"video"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected"];

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeVideoCollectionView];
}

- (void)makeVideoCollectionView{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
//    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 50)/2, 300);
    _videoCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _videoCollectionView.backgroundColor = [UIColor whiteColor];
    [_videoCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"videoCollectionView"];
    _videoCollectionView.dataSource = self;
    _videoCollectionView.delegate = self;

    [self.view addSubview:self.videoCollectionView];
}


#pragma -mark UICollectionView代理实现方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"videoCollectionView" forIndexPath:indexPath];
    if(!cell){
        cell = [[UICollectionViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item %3 == 0){
        return CGSizeMake(self.view.frame.size.width, 100);
    }else{
        return CGSizeMake((self.view.frame.size.width)/2-10, 300);
    }
}

@end
