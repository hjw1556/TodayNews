//
//  NewsDeleteCellView.h
//  TodayNews
//
//  Created by 黄佳玮 on 2020/4/12.
//  Copyright © 2020 黄佳玮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint )point clickBlock:(dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END
