//
//  BYSearchViewCell.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/25.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYSearchViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation BYSearchViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.width = ScreenWidth -50;
        searchBar.height = 30;
        searchBar.x = 15;
        searchBar.placeholder = @"请输入城市中文名或拼音";
        [self.contentView addSubview:searchBar];
    }
    return self;
}





- (void)awakeFromNib {
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
