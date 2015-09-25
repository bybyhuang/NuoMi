//
//  BYCityButton.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/23.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYCityButton.h"
#import "NSString+Extension.h"

@implementation BYCityButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        NSString *text = @"北京";
        UIFont *font = [UIFont systemFontOfSize:15];
        
        [self setImage:[UIImage imageNamed:@"home_arrow_down_red"] forState:UIControlStateNormal];
        


        self.titleLabel.font = font;
        [self setTitle:text forState:UIControlStateNormal];
        
        
        
        
        //232 101 173 粉色的RGB
        UIColor *pinkColor = RGB(229, 50, 99);
        
        [self setTitleColor:pinkColor forState:UIControlStateNormal];
        
        
        
        
        
    }
    return self;
}




/**
 *  在这里面更改label和image的x,y
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}


-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    [self sizeToFit];
}


@end
