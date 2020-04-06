//
//  RecommendViewController.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@end

@implementation RecommendViewController

- (instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"recommend"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"recommend_selected"];

    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeScrollView];

    // Do any additional setup after loading the view.
}

- (void)makeScrollView{
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height*5);
    scrollView.delegate = self;
    NSArray * colorArray = @[[UIColor redColor],[UIColor blueColor],
                             [UIColor greenColor],[UIColor whiteColor],[UIColor orangeColor],[UIColor blackColor]];
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:( {
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = colorArray[i];
            view;
        } ) ];
    }

    
    [self.view addSubview:scrollView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"gundong");
}


@end
