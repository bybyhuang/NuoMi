//
//  BYHomeViewQiangGouCell.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/16.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeViewQiangGouCell.h"
#import "BYQiangGou.h"
#import "BYQiangGouFrame.h"
#import "UIImageView+WebCache.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width

@interface BYHomeViewQiangGouCell()

/**
 *  整个的view
 */
@property (nonatomic,weak)UIView *view;

@property (nonatomic,weak)UILabel *qiangGouLabel;

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

- (void)setQiangGouFrameArray:(NSArray *)qiangGouFrameArray
{
    _qiangGouFrameArray = qiangGouFrameArray;

    NSLog(@"个数 == %ld",qiangGouFrameArray.count);
    
    
    UIButton *button ;
    for (int i =0; i<qiangGouFrameArray.count;i++)
    {
        BYQiangGouFrame *qiangGouFrame = qiangGouFrameArray[i];
        
        CGFloat margin = 5;
        
        button = [self setUpBtn:qiangGouFrame];
        button.x = margin + i *button.width;
        button.y = CGRectGetMaxY(self.qiangGouLabel.frame);
        
        
    }
    
    //设置最上层view的size
    self.view.size = CGSizeMake(screenWidth, CGRectGetMaxY(button.frame));
    
}

- (void)setUpView
{
    UIView *view =  [[UIView alloc] init];
    [self.contentView addSubview:view];
    self.view = view;
    
    UILabel *label = [[UILabel alloc] init];
    [view addSubview:label];
    self.qiangGouLabel = label;
    
    label.text = @"精选抢购";
    label.font = [UIFont systemFontOfSize:15];
    CGSize labelSize = [label sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    label.size = labelSize;
    
    CGFloat margin = 5;
    //设置label 的x,y
    label.x = margin;
    label.y = margin *3;
    
    
    
}


- (UIButton *)setUpBtn:(BYQiangGouFrame *)qiangGouFrame
{
    
    
    //232 101 173 粉色的RGB
    UIColor *pinkColor = RGB(229, 50, 99);
    
    //先出去原始数据
    BYQiangGou *qiangGou = qiangGouFrame.qiangGou;
    //13号字体
    UIFont *fourteen = [UIFont systemFontOfSize:13.5];
    
    CGFloat margin = 5;
    
    
    UIButton *button = [[UIButton alloc] init];
    
    //按钮的宽度
    CGFloat btnWidth = (screenWidth - 2*margin) /3;
    
    //设置button的size
    button.size = CGSizeMake(btnWidth, qiangGouFrame.height);
    
    
    //把按钮添加到view上
    [self.view addSubview:button];
    
    UIImageView *image = [[UIImageView alloc] init];
    [button addSubview:image];
    image.frame = qiangGouFrame.imageFrame;
    
    //加载图片
    [image sd_setImageWithURL:[NSURL URLWithString:qiangGou.na_logo] placeholderImage:[UIImage imageNamed:@"ugc_photo"]];
    
    //设置品牌
    UILabel *brand = [[UILabel alloc] init];
    [button addSubview:brand];
    brand.text = qiangGou.brand;
    brand.font = fourteen;
    brand.frame = qiangGouFrame.brandFrame;
    
    //设置当前的价格
    
    UILabel *currentPrice = [[UILabel alloc] init];
    currentPrice.textColor = pinkColor;
    [button addSubview:currentPrice];
    currentPrice.text = [NSString stringWithFormat:@"￥%ld",qiangGou.current_price];
    currentPrice.font = fourteen;
    currentPrice.frame = qiangGouFrame.currentFrame;
    
    //设置市场价格
    UILabel *marketPrice = [[UILabel alloc] init];
    marketPrice.textColor = pinkColor;
    [button addSubview:marketPrice];
    marketPrice.text = [NSString stringWithFormat:@"%ld",qiangGou.market_price];
    marketPrice.font = [UIFont systemFontOfSize:12];
    marketPrice.frame = qiangGouFrame.marketFrame;
    
    
    
    //添加市场价格上的那条红线
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = pinkColor;
    view.x = marketPrice.x ;
    view.y = marketPrice.y + marketPrice.height /2;
    view.height = 1 ;
    view.width = marketPrice.width;
    
    [button addSubview:view];
    
    //设置按钮常亮的时候的背景颜色
    [button setBackgroundImage:[self imageWithColor:RGB(244, 244, 244)] forState:UIControlStateHighlighted ];
    
    
    return button;

}

/**
 *  把color转换成图片
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
