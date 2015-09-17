//
//  BYBanner.h
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/17.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBanner : NSObject

/*
 
 "banner_id": 4383111,
 "picture_url": "http://cdn00.baidu-img.cn/timg?nuomina&size=w640&imgtype=4&sec=1418745600&di=106a0f71216d4963c16a0fd1be88e943&src=http%3A%2F%2Fhiphotos.baidu.com%2Fbainuo%2Fpic%2Fitem%2F21a4462309f79052aa2a77790af3d7ca7bcbd5bb.jpg",
 "goto_type": 2,
 "cont": "bainuo://web?url=http%3A%2F%2Fhuodong.nuomi.com%2Factshow%2Fmobile%2Fcommon%2Fshort%2Fchihuojie_NA%3Fallcity%3D1%26vip%3D1%26key%3Dcd294eeaf04631ce8808e3e1e38db475%26cuid%3D23eb023553b0805c4ecfcab20c9fb02ad09dcefd&hasshare=1"
 */

/**
*  广告id
*/
@property (nonatomic,assign) NSInteger banner_id;

/**
 *  图片连接地址
 */
@property (nonatomic,copy) NSString *picture_url;


@property (nonatomic,assign) NSInteger goto_type;

/**
 *  跳转的地址
 */
@property (nonatomic,copy) NSString *cont;


+ (instancetype)bannerWithDict:(NSDictionary *)dict;
@end
