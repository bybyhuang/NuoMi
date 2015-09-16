//
//  BYHomeViewQiangGouCell.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/16.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeViewQiangGouCell.h"
#import "BYQiangGou.h"

@interface BYHomeViewQiangGouCell()

/**
 *  整个的view
 */
@property (nonatomic,weak)UIView *view;

@end

@implementation BYHomeViewQiangGouCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self= [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //添加整个View
        [self setUpView];
        
        
    }
    return self;
}

- (void)setQiangGouArray:(NSArray *)qiangGouArray
{
    _qiangGouArray = qiangGouArray;
    
    
}

- (void)setUpView
{
    UIView *view =  [[UIView alloc] init];
    [self.contentView addSubview:view];
    self.view = view;
}


- (void)setUpBtn:(BYQiangGou *)qiangGou
{
    UIButton *button = [[UIButton alloc] init];
    
    UIImageView *image = [[UIImageView alloc] init];
    [button addSubview:image];
    
    
    
    

}

@end
