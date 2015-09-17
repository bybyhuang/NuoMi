//
//  BYClassView.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/15.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYClassView.h"
#import "BYHomeMenuBtn.h"

#define screenWidth  [UIScreen mainScreen].bounds.size.width

#define RandomRGB RGB(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

@interface BYClassView()<UIScrollViewDelegate>

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,weak)UIPageControl *pageControl;

@end

@implementation BYClassView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UIScrollView *scrollView = [[UIScrollView alloc] init];

        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        
        
        //设置scrollView的代理
        scrollView.delegate = self;
        
        scrollView.frame = CGRectMake(0, 0, self.width, 160);
        scrollView.contentSize = CGSizeMake(screenWidth * 2, 0);
        
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        
        //添加一个pageControl
        
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = 2;
        
        [pageControl setValue:[UIImage imageNamed:@"pageControl_default"] forKey:@"pageImage"];
        
        [pageControl setValue:[UIImage imageNamed:@"pageControl_selected"] forKey:@"currentPageImage"];
        
        
        [self addSubview:pageControl];
        
        self.pageControl = pageControl;
        
        //初始化首页菜单
        [self setUpHomeMenu];
        
    }
    return self;
}

- (void)setUpHomeMenu
{
    
    //加载plist文件，用来设置首页菜单
    NSString *plistPath =  [[NSBundle mainBundle] pathForResource:@"menuPlist.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    
    
    
    
    for (int i =0; i<16; i++) {
        int rowCount = 4;
        int pageCount = 8;
        
        
        
        //根据按钮的个数来算出按钮应该所在的位置
        int currentPage = i / pageCount;
        
        int currentRow;
        if(currentPage == 0)
        {
            currentRow = i / rowCount;
        }else
        {
            currentRow = (i / rowCount +1) /2 - 1;
        }
        
        //获取当前的列号
        int currentCol = i % rowCount;
        
        
        //设置button的图片和title
        BYHomeMenuBtn *btn = [[BYHomeMenuBtn alloc] initWithFrame:CGRectMake(0, 0, screenWidth / 4, 70) image:[UIImage imageNamed:array[i][@"image"]] title:array[i][@"title"]];
        
        
        //设置按钮常亮的时候的背景颜色
        [btn setBackgroundImage:[self imageWithColor:RGB(244, 244, 244)] forState:UIControlStateHighlighted ];
//        btn.size = CGSizeMake(screenWidth / 4, 60);
        
        //添加到scrollView上
        [self.scrollView addSubview:btn];
        
        
        btn.x = currentPage * screenWidth + btn.width * currentCol;
        //加10 是让菜单按钮整体离导航栏远一些，较美观
        btn.y = currentRow * btn.height + 10;
        
    }
}




#pragma mark - scrollView的代理方法


/**
 *  结束时调用
 *
 *  @param scrollView <#scrollView description#>
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    //判断当前的页数
    NSInteger currentPage =  ( scrollView.contentOffset.x / self.scrollView.width );
    self.pageControl.currentPage = currentPage;
    
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.pageControl.centerX = screenWidth / 2;
    self.pageControl.centerY = self.scrollView.height + 5;
}

@end
