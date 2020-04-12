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
@property (nonatomic, strong) UILabel * timeLable;
@property (nonatomic, strong) UIImageView * rightImageView;
@property (nonatomic, strong) UIButton * deleteButton;

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
    
    _rightImageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"news"]];
    _rightImageView.backgroundColor = [UIColor redColor];
    
    _deleteButton = [[UIButton alloc]init];
    [_deleteButton setTitle:@"x" forState:UIControlStateNormal];
    [_deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_titleLable];
    [self.contentView addSubview:_sourceLable];
    [self.contentView addSubview:_commentLable];
    [self.contentView addSubview:_timeLable];
    [self.contentView addSubview:_rightImageView];
    [self.contentView addSubview:_deleteButton];
    
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
    
    self.rightImageView.frame = CGRectMake(CGRectGetWidth(self.contentView.frame) - 20, CGRectGetMidY(self.contentView.frame),40, 40);
    self.deleteButton.frame = CGRectMake(CGRectGetMaxX(self.timeLable.frame)+35, CGRectGetMinY(self.timeLable.frame), 20, 20);

}


- (void)delete:(UIButton * )sender{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
