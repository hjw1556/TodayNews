//
//  NewTableViewCell.h
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/5.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NewTableViewCellDelegate <NSObject>

- (void)tableViewCell: (UITableViewCell * )tableViewCell  clickDeleteButton:(UIButton *)deleteButton;

@end

@interface NewTableViewCell : UITableViewCell

@property (nonatomic, weak) id<NewTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
