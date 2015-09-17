//
//  BYHomeBannerCell.h
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/17.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYHomeBannerCell;
@protocol BYHomeBannerCellDelegate <NSObject>

- (void)bannerCell:(BYHomeBannerCell *)bannerCell clickDeleteBtn:(UIButton *)button;


@end

@interface BYHomeBannerCell : UITableViewCell

@property (nonatomic,strong)NSArray *bannerArray;

/**
 *  代理
 */

@property (nonatomic,weak)id<BYHomeBannerCellDelegate> delegate;

@end
