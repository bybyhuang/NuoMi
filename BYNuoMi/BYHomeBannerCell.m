//
//  BYHomeBannerCell.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/17.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeBannerCell.h"
//#import "UIImageView+WebCache.h"
#import "BYBanner.h"
#import "UIButton+WebCache.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width

@interface BYHomeBannerCell()<UIScrollViewDelegate>

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,weak)UIPageControl *pageControl;

@end

@implementation BYHomeBannerCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] )
    {
        
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        //设置scrollView的分页效果
        scrollView.pagingEnabled = YES;
        
        //设置不显示水平和垂直的滚动栏
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        
        //成为scrollView的代理，用于设置pageControl
        scrollView.delegate = self;
        
        [self.contentView addSubview:scrollView];
        
        self.scrollView = scrollView;
        
        scrollView.x = 0;
        scrollView.y = 0;
        scrollView.width = screenWidth;
        scrollView.height = 64;
    
        //添加删除按钮上去
        UIButton *deleteButton = [[UIButton alloc] init];
        [deleteButton setImage:[UIImage imageNamed:@"textfieldDelete"] forState:UIControlStateNormal];
        [self.contentView addSubview:deleteButton];
        
        deleteButton.size = CGSizeMake(25, 25);
        deleteButton.x = screenWidth - 50;
        deleteButton.centerY = scrollView.height / 2;
        
        [deleteButton addTarget:self action:@selector(clickDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    return self;
}

- (void)setBannerArray:(NSArray *)bannerArray
{
    _bannerArray = bannerArray;
    
    //添加pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    [pageControl setValue:[UIImage imageNamed:@"pageControl_default"] forKey:@"pageImage"];
    
    
    [pageControl setValue:[UIImage imageNamed:@"pageControl_selected"] forKey:@"currentPageImage"];
    
    pageControl.numberOfPages = bannerArray.count;
    [self.contentView addSubview:pageControl];
    
    self.pageControl = pageControl;
    
    
    
    
    
    for(int i =0; i<bannerArray.count; i++)
    {
        UIButton *bannerBtn = [[UIButton alloc] init];
//        bannerBtn.backgroundColor = RandomRGB;
        
        
//        UIImageView *bannerView = [[UIImageView alloc] init];
        bannerBtn.width = self.scrollView.width;
        bannerBtn.height = self.scrollView.height;
        bannerBtn.x = self.scrollView.width * i;
        bannerBtn.y = 0;
        
        //取出模型数据
        BYBanner *banner = bannerArray[i];
        NSLog(@"%@",banner.picture_url);
        [bannerBtn sd_setImageWithURL:[NSURL URLWithString:banner.picture_url] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"ugc_photo"]];
        
        [self.scrollView addSubview:bannerBtn];
    }
    
    self.scrollView.contentSize = CGSizeMake(screenWidth * bannerArray.count, 0);
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(turnScrollView) userInfo:nil repeats:YES];
}

/**
 *  让scrollView滚动
 *
 *  @param button <#button description#>
 */

- (void)turnScrollView
{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        if(self.scrollView.contentOffset.x < (self.bannerArray.count -1) * screenWidth)
        {
            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x + screenWidth, self.scrollView.contentOffset.y);
        }else
        {
            self.scrollView.contentOffset = CGPointMake(0 + screenWidth, self.scrollView.contentOffset.y);
        }
        
        
        
    }];
}


- (void)clickDeleteBtn:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(bannerCell:clickDeleteBtn:)])
    {
        [self.delegate bannerCell:self clickDeleteBtn:button];
    }
}


#pragma mark - scrollView的代理

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //判断当前的页数
    NSInteger currentPage =  ( scrollView.contentOffset.x / self.scrollView.width );
    self.pageControl.currentPage = currentPage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.pageControl.centerX = self.scrollView.width / 2;
    self.pageControl.y  = self.scrollView.height - 10;
}

@end
