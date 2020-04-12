//
//  NewsDetailViewController.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/11.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "NewsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "NewsDeleteCellView.h"

@interface NewsDetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView * webView;

@property (nonatomic, strong) UIProgressView * progressView;

@end

@implementation NewsDetailViewController

- (void)dealloc{
    //移除监听
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebView];
}

- (void)createWebView{
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
    [self.view addSubview:self.progressView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"即将加载");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.progressView.progress = self.webView.estimatedProgress;
    NSLog(@"change");

}





@end
