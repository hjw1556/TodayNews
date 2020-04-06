//
//  AccountViewController.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"account"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"account_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
