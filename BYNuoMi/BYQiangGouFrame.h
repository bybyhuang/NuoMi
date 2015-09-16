//
//  BYQiangGouFrame.h
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/16.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BYQiangGou;
@interface BYQiangGouFrame : NSObject

//抢购的原始数据
@property (nonatomic,strong)BYQiangGou *qiangGou;


/**
 *  title的frame
 */
@property (nonatomic,assign) CGRect imageFrame;

@property (nonatomic,assign) CGRect brandFrame;


@property (nonatomic,assign) CGRect marketFrame;

@property (nonatomic,assign) CGRect currentFrame;


@property (nonatomic,assign) CGFloat height;



@end
