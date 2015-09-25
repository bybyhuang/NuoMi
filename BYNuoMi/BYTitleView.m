//
//  BYTitleView.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/23.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYTitleView.h"
#import "BYCityButton.h"

@interface BYTitleView()

@property (nonatomic,weak)BYCityButton *cityButton;

@end

@implementation BYTitleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        //向View中添加城市按钮
        BYCityButton *cityButton = [[BYCityButton alloc] init];
        [self addSubview:cityButton];
        self.cityButton = cityButton;
        
        //添加监听方法
        [cityButton addTarget:self action:@selector(clickCityButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cityButton.x = 10;
    self.cityButton.centerY = self.height / 2;
}


#pragma mark -按钮的监听方法

-(void)clickCityButton:(BYCityButton *)cityButton
{
    if([self.delegate respondsToSelector:@selector(titleView:clickCityButton:)])
    {
        [self.delegate titleView:self clickCityButton:self.cityButton];
    }
    
}

@end
