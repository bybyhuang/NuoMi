//
//  BYHomeViewController.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/14.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeViewController.h"
#import "BYHttpTool.h"
#import "BYQiangGou.h"
#import "BYQiangGouFrame.h"
#import "BYBanner.h"

#import "BYHomeBannerCell.h"
#import "BYHomeViewQiangGouCell.h"
#import "BYHomeViewClassCell.h"

#import "BYTitleView.h"
#import "BYCityViewController.h"


@interface BYHomeViewController ()<BYHomeBannerCellDelegate,BYTitleViewDelegate>

@property (nonatomic,strong)NSMutableArray *statuses;

@property (nonatomic,strong)NSMutableArray *qiangGouFrameArray;

@property (nonatomic,strong)NSMutableArray *bannerArray;

@end

@implementation BYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTitle];
    
    //设置标题数据
    
//    NSString *string = @"http://cdn00.baidu-img.cn/timg?nuomina&size=w320&imgtype=4&sec=1418745600&di=82ab1161a14fa58073ddc71e184a0440&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fnuomi%2Fpic%2Fitem%2F94cad1c8a786c9177f44d18dcc3d70cf3bc7573a.jpg";
//    NSString *s1 =[string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",s1);
    [self getHomeStatuse];
    
}


- (NSMutableArray *)statuses
{
    if(_statuses == nil)
    {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

/**
 *  抢购frame数组的懒加载
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)qiangGouFrameArray
{
    if(_qiangGouFrameArray == nil)
    {
        _qiangGouFrameArray = [NSMutableArray array];
    }
    return _qiangGouFrameArray;
}


/**
 *  广告数据模型
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)bannerArray
{
    if(_bannerArray == nil)
    {
        _bannerArray = [NSMutableArray array];
        
    }
    return _bannerArray;
}



-(void)setUpTitle
{
    
    BYTitleView *titleView = [[BYTitleView alloc] init];
    titleView.size = self.navigationController.navigationBar.size;
//    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleView;
    
    //让当前控制器成为titleView的代理
    titleView.delegate = self;
    
//    view.backgroundColor = [UIColor redColor];
    
    
//    self presentViewController:[] animated:<#(BOOL)#> completion:<#^(void)completion#>
    
}

/**
 *  获取首页数据
 */
- (void)getHomeStatuse
{
    
    NSString *path = @"http://112.80.255.88/naserver/home/homepage?appid=ios&bduss=&channel=com_dot_apple&cityid=100010000&cuid=23eb023553b0805c4ecfcab20c9fb02ad09dcefd&device=iPhone&ha=5&lbsidfa=2A6402F1-89AE-4A7A-842A-DF2AC2F76BA9&location=35.279810%2C115.468840&logpage=Home&net=wifi&os=8.4&sheight=1136&sign=57a3b563a88525dcdb58811b068ed647&swidth=640&terminal_type=ios&timestamp=1442370987935&tn=ios&uuid=23eb023553b0805c4ecfcab20c9fb02ad09dcefd&v=5.12.0";
    
    [BYHttpTool GET:path parameters:nil success:^(id response) {
        
        
        
        //获取banner的数据
        for (NSDictionary *dict in response[@"data"][@"banners"])
        {
            BYBanner *banner = [BYBanner bannerWithDict:dict];
//            NSLog(@"1==%@ 2==%@",banner.picture_url,banner.cont);
            
            [self.bannerArray addObject:banner];
            
            
        }
        
        [self.statuses addObject:self.bannerArray ];
        
        
        
        for (NSDictionary *dict in response[@"data"][@"topten"][@"list"])
        {
            
            BYQiangGou *qiangGou = [BYQiangGou qiangGouWithDict:dict];
            
            //转换成frame模型
            BYQiangGouFrame *qiangGouFrame = [[BYQiangGouFrame alloc] init];
            qiangGouFrame.qiangGou = qiangGou;
            
            //把带有frame的模型添加到数组中去
            [self.qiangGouFrameArray addObject:qiangGouFrame];
         
        }
        //把含有广告数据的模型添加到总数据array中
        [self.statuses addObject:self.qiangGouFrameArray];
        
        
        
        //刷新表格数据
        [self.tableView reloadData];
        
        //获取到精彩抢购的dict，转成模型
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.statuses.count +1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger temp = 0;
    if(self.statuses.count < 2)
    {
        temp = 1;
    }
    
    if(indexPath.row == (0 - temp))
    {
        
//        NSLog(@"当前所在的%ld",indexPath.section);
        BYHomeBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"banner"];
        if(cell == nil)
        {
            cell = [[BYHomeBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"banner"];
            
            
            
        }
        //让当前控制器成为广告cell的代理
        cell.delegate = self;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.bannerArray = self.bannerArray;
        return cell;
    }
    
    if(indexPath.row == 1)
    {
        BYHomeViewClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"class"];
        
        if(cell == nil)
        {
            cell = [[BYHomeViewClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"class"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    if(indexPath.row == 2)
    {
        BYHomeViewQiangGouCell *qiangGouCell = [tableView dequeueReusableCellWithIdentifier:@"qiangGou"];
        
        if(qiangGouCell == nil)
        {
            qiangGouCell = [[BYHomeViewQiangGouCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qiangGou"];
        }
        
        qiangGouCell.qiangGouFrameArray = self.qiangGouFrameArray;
        
        //设置cell不能被选中
        qiangGouCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return qiangGouCell;
        
    }
    
    
    
    return [[UITableViewCell alloc] init];
    
}


#pragma mark - banner代理方法

- (void)bannerCell:(BYHomeBannerCell *)bannerCell clickDeleteBtn:(UIButton *)button
{
    
    NSLog(@"删除广告栏");
    

    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    
    
    [self.statuses removeObjectAtIndex:0];
    
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


#pragma mark - titleView的代理方法
- (void)titleView:(BYTitleView *)titleView clickCityButton:(BYCityButton *)cityButton
{
    
    
    BYCityViewController *viewController = [[BYCityViewController alloc ]init];
    //包装一个UINavigationController
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    
    
//    viewController.view.backgroundColor = [UIColor redColor];
    
    [self presentViewController:nav animated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger temp = 0;
    if(self.statuses.count<2)
    {
        temp = 1;
    }
    
    if(indexPath.row == (0 -temp) )
    {
        return 64;
    }else
    {
        return 180;
    }
    
    return 180;
}

@end
