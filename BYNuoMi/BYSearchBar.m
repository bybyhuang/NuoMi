//
//  BYSearchBar.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/25.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYSearchBar.h"

@implementation BYSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        //设置提示的内容
        self.placeholder = @"请输入搜索条件";
        self.font = [UIFont systemFontOfSize:14];
        //设置它的背景图片
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        self.width = 300;
        self.height = 30;
        
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.height = 30;
        searchIcon.width = 30;
        
        [searchIcon setContentMode:UIViewContentModeCenter];
        
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
    
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
