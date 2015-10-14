//
//  BYSearchViewCell.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/25.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYSearchViewCell.h"
#import "BYSearchBar.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface BYSearchViewCell()<UITextFieldDelegate>



@end


@implementation BYSearchViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        
        BYSearchBar *searchBar = [BYSearchBar searchBar];
        searchBar.width = ScreenWidth - 30;
        searchBar.x = 15;
        searchBar.y = 10;
        searchBar.placeholder = @"请输入城市中文名或拼音";
        [self.contentView addSubview:searchBar];
        searchBar.delegate = self;
        
        
    }
    return self;
}

#pragma mark textfield的代理方法

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
        UIView *view =  [[UIView alloc] init];
        view.backgroundColor = [UIColor lightGrayColor];
        view.width = ScreenWidth;
        view.height = 64;
        [window addSubview:view];
        
        
        
    } completion:nil];
    

    [self searchCity];
    
}

-(void)searchCity
{
    NSLog(@"点击了123123");
    //需要发出点击搜索框的通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center postNotificationName:@"BYSearchCityNotification" object:nil userInfo:nil];
    
    
}


- (void)awakeFromNib {
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
