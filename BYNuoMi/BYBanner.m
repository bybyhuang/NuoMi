//
//  BYBanner.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/17.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYBanner.h"
#import "MJExtension.h"
#import "NSString+Extension.h"

@implementation BYBanner

+ (instancetype)bannerWithDict:(NSDictionary *)dict
{
    //先把字典转换成模型
    BYBanner *banner = [BYBanner objectWithKeyValues:dict];
    
////    //需要把http连接进行转码,在赋值给模型
//    NSString *pictureUrl = [banner.picture_url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    //把scr= 之后的截取出来
//    NSRange pictureRange = [pictureUrl rangeOfString:@"src="];
//    
//    //在赋值给模型
//    banner.picture_url = [pictureUrl substringFromIndex:pictureRange.location + pictureRange.length];
//    
    banner.picture_url = [banner.picture_url urlStringWithSubString:@"src="];

    banner.cont = [banner.cont urlStringWithSubString:@"url="];
    
    
    
   
    
    //跳转界面和上面一样
    //可以写成一个分类-- 写到NSString- extension中
    

    
    return banner;
}



@end
