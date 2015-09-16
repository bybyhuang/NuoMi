//
//  BYQiangGou.h
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/16.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYQiangGou : NSObject

/**
 *  "deal_id": "3658238",
 "brand": "蜀江烤鱼",
 "market_price": 30000,
 "current_price": 19200,
 "na_logo": "http://cdn00.baidu-img.cn/timg?nuomina&size=w320&imgtype=4&sec=1418745600&di=82ab1161a14fa58073ddc71e184a0440&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fnuomi%2Fpic%2Fitem%2F94cad1c8a786c9177f44d18dcc3d70cf3bc7573a.jpg"
 */

@property (nonatomic,assign) NSInteger deal_id;

@property (nonatomic,copy) NSString *brand;

@property (nonatomic,assign) NSInteger market_price;

@property (nonatomic,assign) NSInteger current_price;

@property (nonatomic,copy) NSString *na_logo;


+ (instancetype)qiangGouWithDict:(NSDictionary *)dict;

@end
