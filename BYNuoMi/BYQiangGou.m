//
//  BYQiangGou.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/16.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYQiangGou.h"
#import "MJExtension.h"

@implementation BYQiangGou


+ (instancetype)qiangGouWithDict:(NSDictionary *)dict
{
//    BYQiangGou *qiangGou = [[BYQiangGou alloc] init];
    
//    qiangGou.deal_id = [dict[@"deal_id"] integerValue];
//    
//    qiangGou.brand = dict[@"brand"];
//    
//    qiangGou.market_price = [dict[@"market_price"] integerValue];
//    
//    qiangGou.current_price = [dict[@"current_price"] integerValue];
//    
    
    BYQiangGou *qiangGou = [BYQiangGou objectWithKeyValues:dict];
    
    //把连接中的url中含有 %2A等进行转码，变成//:等
    NSString *urlString = [qiangGou.na_logo stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
//     NSLog(@"deal_id =%ld , brand = %@ ,market_price=%ld , current_price =%ld,na_logo = %@",qiangGou.deal_id,qiangGou.brand,qiangGou.market_price,qiangGou.current_price,qiangGou.na_logo);
    
    //查找src=
    NSRange srcRange = [urlString rangeOfString:@"src="];
    
    //把从src=之后的再赋值给na_logo
    qiangGou.na_logo = [urlString substringFromIndex:srcRange.location+srcRange.length];
    
    NSLog(@"deal_id =%ld , brand = %@ ,market_price=%ld , current_price =%ld,na_logo = %@",qiangGou.deal_id,qiangGou.brand,qiangGou.market_price,qiangGou.current_price,qiangGou.na_logo);
    
    return qiangGou;
}

@end
