//
//  BYHomeMenuBtn.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/15.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeMenuBtn.h"

@interface BYHomeMenuBtn()

@property (nonatomic,weak)UIImageView *btnImageView;

@property (nonatomic,weak)UILabel *label;
@end

@implementation BYHomeMenuBtn

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title
{
    if(self = [super initWithFrame:frame])
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:imageView];
        self.btnImageView = imageView;
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:14];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        CGSize labelSize = [label sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        label.size = labelSize;
        
        
        [self addSubview:label];
        
        self.label = label;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.btnImageView.centerX = self.width / 2;
    self.btnImageView.centerY = (self.height -self.label.height)  / 2;
    
    //设置label的x,y;
    self.label.centerX = self.width / 2;
    self.label.y = CGRectGetMaxY(self.btnImageView.frame) + 5;
}

@end
