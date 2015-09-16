//
//  BYTabBarController.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/14.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYTabBarController.h"
#import "BYHomeViewController.h"
#import "BYNearViewController.h"
#import "BYSelectViewController.h"
#import "BYMineViewController.h"



@interface BYTabBarController ()

@end

@implementation BYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    BYHomeViewController *homeViewController = [[BYHomeViewController alloc] init];
    
    BYNearViewController *nearController = [[BYNearViewController alloc] init];
    
    BYSelectViewController *selectController = [[BYSelectViewController alloc] init];
    
    BYMineViewController *mineController = [[BYMineViewController alloc] init];
 
    
    
    [self addController:homeViewController title:@"首页" image:@"icon_tab_shouye_normal" selectImage:@"icon_tab_shouye_highlight"];
    
    [self addController:nearController title:@"附近" image:@"icon_tab_fujin_normal" selectImage:@"icon_tab_fujin_highlight"];
    
    [self addController:selectController title:@"精选" image:@"icon_tab_selection_normal" selectImage:@"icon_tab_selection_highlight"];
    
    [self addController:mineController title:@"我的" image:@"icon_tab_wode_normal" selectImage:@"icon_tab_wode_highlight"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)addController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    controller.title = title;
    
    controller.tabBarItem.image = [UIImage imageNamed:image];
    
    //设置选中时候的图片，且不会变蓝
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    
    //设置tabbar文字的颜色
    NSMutableDictionary *normalColor = [NSMutableDictionary dictionary];
    normalColor[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    

    //设置选中的时候为粉色
    NSMutableDictionary *selectColor = [NSMutableDictionary dictionary];
    selectColor[NSForegroundColorAttributeName] = RGB(231, 75, 118);
    
    
    [controller.tabBarItem setTitleTextAttributes:normalColor forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:selectColor forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
    
    
}




@end
