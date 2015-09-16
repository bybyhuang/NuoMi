//
//  BYHomeViewController.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/14.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeViewController.h"
#import "BYHomeViewClassCell.h"
#import "BYHttpTool.h"
#import "BYQiangGou.h"

@interface BYHomeViewController ()

@end

@implementation BYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSString *string = @"http://cdn00.baidu-img.cn/timg?nuomina&size=w320&imgtype=4&sec=1418745600&di=82ab1161a14fa58073ddc71e184a0440&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fnuomi%2Fpic%2Fitem%2F94cad1c8a786c9177f44d18dcc3d70cf3bc7573a.jpg";
//    NSString *s1 =[string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",s1);
    [self getHomeStatuse];
    
}


- (void)getHomeStatuse
{
    
    NSString *path = @"http://112.80.255.88/naserver/home/homepage?appid=ios&bduss=&channel=com_dot_apple&cityid=100010000&cuid=23eb023553b0805c4ecfcab20c9fb02ad09dcefd&device=iPhone&ha=5&lbsidfa=2A6402F1-89AE-4A7A-842A-DF2AC2F76BA9&location=35.279810%2C115.468840&logpage=Home&net=wifi&os=8.4&sheight=1136&sign=57a3b563a88525dcdb58811b068ed647&swidth=640&terminal_type=ios&timestamp=1442370987935&tn=ios&uuid=23eb023553b0805c4ecfcab20c9fb02ad09dcefd&v=5.12.0";
    
    [BYHttpTool GET:path parameters:nil success:^(id response) {
//        NSLog(@"%@",response[@"data"][@"topten"][@"list"]);
        
        for (NSDictionary *dict in response[@"data"][@"topten"][@"list"])
        {
            
             [BYQiangGou qiangGouWithDict:dict];
        }
        
        
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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BYHomeViewClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"class"];
    
    if(cell == nil)
    {
        cell = [[BYHomeViewClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"class"];
    }
    
    
    return cell;
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
    if(indexPath.row == 0 )
    {
        return 180;
    }
    
    return 64;
}

@end
