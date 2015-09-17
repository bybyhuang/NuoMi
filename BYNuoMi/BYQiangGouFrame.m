//
//  BYQiangGouFrame.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/16.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYQiangGouFrame.h"
#import "BYQiangGou.h"
#import "NSString+Extension.h"

@implementation BYQiangGouFrame



- (void)setQiangGou:(BYQiangGou *)qiangGou
{
    _qiangGou = qiangGou;
    
    //一个三个按钮,每个按钮的宽度就是屏幕 - 20 /3
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 5;
    
    //80/48
    CGFloat btnWidth = (screenWidth - 2*margin) /3;
    
    CGFloat imageX = margin;
    CGFloat imageY = 2 *margin;
    CGFloat imageWidth = btnWidth - 2 *margin ;
    
    //0.6是图片宽高的比例
    CGFloat imageHeight = imageWidth * 0.6;
    CGRect imageFrame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    self.imageFrame = imageFrame;
    
    //计算标题所需的宽高
    
    CGSize brandSize = [qiangGou.brand sizeWithTextFont:[UIFont systemFontOfSize:13.5]];
    
    CGFloat brandX = (btnWidth - brandSize.width) /2;
    CGFloat brandY = CGRectGetMaxY(imageFrame) + 2 *margin;
    CGRect brandFrame = (CGRect){{brandX,brandY},brandSize};
    
    self.brandFrame = brandFrame;
    
    NSString *currentPrice = [NSString stringWithFormat:@"￥%ld",qiangGou.current_price];
    CGSize currentSize= [currentPrice sizeWithTextFont:[UIFont systemFontOfSize:14]];
    
    NSString *marketPrice = [NSString stringWithFormat:@"%ld",qiangGou.market_price];
    CGSize marketSize = [marketPrice sizeWithTextFont:[UIFont systemFontOfSize:12]];
    
    //设置当前价格的frame
    CGFloat currentX = ( btnWidth - currentSize.width - marketSize.width) / 2;
    CGFloat currentY = CGRectGetMaxY(brandFrame) + 2 *margin;
    CGRect currentFrame = (CGRect){{currentX,currentY},currentSize};
    
    self.currentFrame = currentFrame;
    
    //设置市场价格的frame
    CGFloat marketX = CGRectGetMaxX(currentFrame) + margin ;
    CGFloat marketY = currentY + currentSize.height - marketSize.height;
    CGRect marketFrame = (CGRect){{marketX,marketY},marketSize};
    
    self.marketFrame = marketFrame;
    
    self.height = CGRectGetMaxY(marketFrame) + 3 * margin;
    
    
    
    
}
@end
