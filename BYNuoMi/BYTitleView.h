//
//  BYTitleView.h
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/23.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYTitleView,BYCityButton;
@protocol BYTitleViewDelegate <NSObject>

-(void)titleView:(BYTitleView *)titleView clickCityButton:(BYCityButton *)cityButton;


@end

@interface BYTitleView : UIView


@property (nonatomic,weak)id<BYTitleViewDelegate> delegate;

@end
