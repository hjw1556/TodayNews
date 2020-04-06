//
//  NewTableViewCell.m
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewTableViewCell()

@property (nonatomic, strong) UILabel * titleLable;
@property (nonatomic, strong) UILabel * sourceLable;
@property (nonatomic, strong) UILabel * commentLable;
@property(nonatomic, strong) UILabel * timeLable;

@end

@implementation NewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self makeUI];
    }
    return self;
}

- (void)makeUI{
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 50)];
    _titleLable.font = [UIFont systemFontOfSize:14];
    _titleLable.textColor = [UIColor blackColor];
    
    _sourceLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 50, 20)];
    _sourceLable.textColor = [UIColor grayColor];
    _sourceLable.font = [UIFont systemFontOfSize:14];
    
    _commentLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 80, 50, 20)];
    _commentLable.textColor = [UIColor grayColor];
    _commentLable.font = [UIFont systemFontOfSize:14];
    
    
    _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(150, 80, 50, 20)];
    _timeLable.textColor = [UIColor grayColor];
    _timeLable.font = [UIFont systemFontOfSize:14];


    [self.contentView addSubview:_titleLable];
    [self.contentView addSubview:_sourceLable];
    [self.contentView addSubview:_commentLable];
    [self.contentView addSubview:_timeLable];

    
}

- (void)layoutTableViewCell{
    self.titleLable.text = @"极客时间iOS开发";
    
    self.sourceLable.text = @"极客时间";
    [self.sourceLable sizeToFit];
    
    self.commentLable.text = @"1888评论";
    [self.commentLable sizeToFit];
    self.commentLable.frame = CGRectMake(self.sourceLable.frame.origin.x + self.sourceLable.frame.size.width + 15, self.commentLable.frame.origin.y, self.commentLable.frame.size.width, self.commentLable.frame.size.height);
    
    self.timeLable.text = @"三分钟前";
    [self.timeLable sizeToFit];
    self.timeLable.frame = CGRectMake(self.commentLable.frame.origin.x + self.commentLable.frame.size.width + 15, self.commentLable.frame.origin.y, self.timeLable.frame.size.width, self.timeLable.frame.size.height);

}



@end
