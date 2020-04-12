//
//  NewsDeleteCellView.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/12.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "NewsDeleteCellView.h"

@interface  NewsDeleteCellView()

@property (nonatomic, strong) UIView * backgroundView;

@property (nonatomic, strong) UIButton * deleteButton;

@property (nonatomic, copy) dispatch_block_t deleteBlock;

@end

@implementation NewsDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview: ({
            _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            [_backgroundView addGestureRecognizer: ({
                UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        
        [self addSubview: ({
            _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void)showDeleteViewFromPoint:(CGPoint )point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:1.f  delay: 0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"123");
    }];
    
}

- (void)dismissDeleteView{
    [UIView animateWithDuration:1.2f animations:^{
        [self removeFromSuperview];
    }];
}

- (void)clickButton:(UIButton *)sender{
    if(_deleteBlock){
        _deleteBlock();
    }
    [self dismissDeleteView];
    
}


@end
