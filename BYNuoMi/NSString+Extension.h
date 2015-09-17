//
//  NSString+Extension.h
//  BY新浪微博
//
//  Created by huangbaoyu on 15/7/22.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  计算文字所占的宽高
 *
 *  @param font 使用的字体
 *  @param size 允许的最大范围
 *
 *  @return 所占的宽高
 */
- (CGSize)sizeWithTextFont:(UIFont *)font Size:(CGSize)size;

/**
 *  计算文字所占的宽高
 *
 *  @param font 使用的字体
 *
 *  @return 允许的最大范围
 */
- (CGSize)sizeWithTextFont:(UIFont *)font;


/**
 *  根据所给的子串，把子串之后的截取出来
 *
 *  @param subString 子串
 *
 *  @return 返回截取好的字符串
 */
- (NSString *)urlStringWithSubString:(NSString *)subString;

@end
