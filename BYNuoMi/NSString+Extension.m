//
//  NSString+Extension.m
//  BY新浪微博
//
//  Created by huangbaoyu on 15/7/22.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 * 算出字符串所占的宽高
 */
- (CGSize)sizeWithTextFont:(UIFont *)font Size:(CGSize)size
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

- (CGSize)sizeWithTextFont:(UIFont *)font
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    return [self sizeWithAttributes:dict];
}


- (NSString *)urlStringWithSubString:(NSString *)subString
{
    //需要把http连接进行转码,在赋值给模型
    NSString *urlString= [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    //把scr= 之后的截取出来
    NSRange urlRange = [urlString rangeOfString:subString];
    
    
    //获取的范围需要判断不能超出NSString的长度
    if(urlRange.location < urlString.length)
    {
        //在赋值给模型
        urlString = [urlString substringFromIndex:urlRange.location + urlRange.length];
    }
    
    
    
    
    return urlString;
}
@end
