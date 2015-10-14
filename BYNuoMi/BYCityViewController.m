//
//  BYCityViewController.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/25.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYCityViewController.h"
#import "FMDB.h"
#import "BYCity.h"

#import "BYSearchViewCell.h"

@interface BYCityViewController ()


@property (nonatomic,strong)NSMutableArray *cityArray;

@property (nonatomic,strong)NSMutableArray *cityInitials;

@end

@implementation BYCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.sectionIndexColor = [UIColor redColor];

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(dismissLastController)];
    
    //添加消息监听器
    [self setUpNotification];
    
}

/**
 *  添加消息监听器
 */
- (void)setUpNotification
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(searchCity:) name:@"BYSearchCityNotification" object:nil];
}

- (void)searchCity:(NSNotification *)notificationxr
{
    
    
    self.tableView.sectionIndexColor = [UIColor clearColor];
    
}



/**
 *  懒加载城市缩写
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)cityInitials
{
    if(_cityInitials == nil)
    {
        _cityInitials = [NSMutableArray array];
        
        NSString *sqlString = [[NSBundle mainBundle] pathForResource:@"CITYDATADB" ofType:@"sqlite"];
        
        
        FMDatabase *dataBase = [[FMDatabase alloc] initWithPath:sqlString];
        [dataBase open];
        
        //查询数据,对abc进行排序
        FMResultSet *resultSet = [dataBase executeQueryWithFormat:@"select distinct initials from City ORDER BY initials;  "];
        
        NSMutableArray *array = [NSMutableArray array];
        
        while ([resultSet next]) {
            
            NSString *initial = [resultSet stringForColumn:@"initials"];
            [array addObject:initial];
        }
        _cityInitials = array;
        
    }
    return _cityInitials;
}

/**
 *  懒加载
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)cityArray
{
    if(_cityArray == nil)
        
        
    {
        
       
        NSString *sqlString = [[NSBundle mainBundle] pathForResource:@"CITYDATADB" ofType:@"sqlite"];
        
        
        FMDatabase *dataBase = [[FMDatabase alloc] initWithPath:sqlString];
        [dataBase open];
        
        
        NSMutableArray *cityArray = [NSMutableArray array];
        
        //查询数据,根据首字母来查询
        
        for (NSString *initial in self.cityInitials) {
            
            FMResultSet *resultSet = [dataBase executeQueryWithFormat:@"SELECT *FROM City where initials = %@;",initial];
            
            NSMutableArray *array = [NSMutableArray array];
            
            while ([resultSet next]) {
                BYCity *city = [[BYCity alloc] init];
                city.city_code = [resultSet stringForColumn:@"city_code"];
                city.city_name = [resultSet stringForColumn:@"city_name"];
                city.short_name = [resultSet stringForColumn:@"short_name"];
                city.initials = [resultSet stringForColumn:@"initials"];
                city.city_url = [resultSet stringForColumn:@"city_url"];
                
                //添加到array
                [array addObject:city];
            }
            
            //在把存到的放到字典中
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[initial] = array;
            
            //把字典添加到整个的大数组中
            [cityArray addObject:dict];
            
        }
        
        
        
        
        [dataBase close];
        _cityArray = cityArray;
    }
    return _cityArray;
}




-(void)dismissLastController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/**
 *  设置tableView的行数

 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.cityInitials.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //先取出组所对应的首字母
    if(section - 1>=0)
    {
        NSString *initial =  self.cityInitials[section-1];
        NSArray *array = self.cityArray[section-1][initial];
        
        return array.count;
    }
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section-1 >=0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"city"];
        
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] init];
        }
        
        //先取出组所对应的首字母
        NSString *initial =  self.cityInitials[indexPath.section-1];
        NSArray *array = self.cityArray[indexPath.section-1][initial];
        //取出具体的城市模型
        BYCity *city = array[indexPath.row];
        
        cell.textLabel.text = city.city_name;
        return cell;
    }
    
    if(indexPath.section==0)
    {
        BYSearchViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search"];
        if(cell == nil)
        {
            cell = [[BYSearchViewCell alloc] init];
            
        }
        return cell;
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section-1>=0)
    {
        return self.cityInitials[section-1];
    }
    return nil;
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.cityInitials];
    [array insertObject:@"#" atIndex:0];
    
    return array;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //隐藏导航栏
    
//    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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

@end
