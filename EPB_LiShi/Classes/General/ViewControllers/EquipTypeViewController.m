//
//  EquipTypeViewController.m
//  EPB_LiShi
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "EquipTypeViewController.h"
#import "ToolsRequest.h"
#import "catnameModel.h"
#import "ListModel.h"

@interface EquipTypeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *EquipTableView;
//存储装备的的分类
@property (strong, nonatomic) NSMutableArray *CatNameArr;
//存储装备的种类
@property (strong, nonatomic) NSMutableArray *ListIdArr;
//存储装备名称
@property (strong, nonatomic) NSMutableDictionary *ListNameArr;
@property (strong, nonatomic) NSMutableArray *NameArr;

@end

//设置cell
static NSString *const cellReuseIdentifier = @"11";

@implementation EquipTypeViewController
/*
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.EquipTableView reloadData];
//}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"装备分类";
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    self.CatNameArr = [NSMutableArray array];
    self.ListIdArr = [NSMutableArray array];
    self.ListNameArr = [[NSMutableDictionary alloc] init];
    self.NameArr = [NSMutableArray array];
    
    self.EquipTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    //设置代理
    self.EquipTableView.dataSource = self;
    self.EquipTableView.delegate = self;
    
    //注册cell
    [self.EquipTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    
    [self.view addSubview:self.EquipTableView];
    
    //请求数据调用的方法
    [self EquipDataRequest];
    
    self.view.backgroundColor = [UIColor purpleColor];
}

#pragma mark --- 请求服装类型 ---
- (void)EquipDataRequest
{
    __weak typeof(self) weakself = self;
    ToolsRequest *request = [[ToolsRequest alloc] init];
    [request ToolsRequestWithParameter:nil success:^(NSDictionary *dic) {

        NSArray *event = [[dic objectForKey:@"data"] objectForKey:@"cateList"];
        for (NSDictionary *tempDic in event) {
            
            catnameModel *model = [[catnameModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakself.CatNameArr addObject:model.catname];

            NSMutableArray *tempArray = @[].mutableCopy;
            for (NSDictionary *tempDic in model.list) {
                ListModel *model = [ListModel new];
                [model setValuesForKeysWithDictionary:tempDic];
                [tempArray addObject:model];
            }
            [self.ListNameArr setObject:tempArray forKey:model.catname];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakself.EquipTableView reloadData];
        });
        
//        NSLog(@"listName == %@",weakself.ListNameArr);
    } failure:^(NSError *error) {
        
        NSLog(@"failure == %@",error);
    }];
}

#pragma mark --- 设置区数 ---
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.CatNameArr.count;
}

#pragma mark --- 设置分区标题 ---
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.CatNameArr[section];
}

#pragma mark --- 设置行数 ---
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.ListNameArr[self.CatNameArr[section]] count];
}

#pragma mark --- 设置cell ---
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];

    ListModel *model = self.ListNameArr[self.CatNameArr[indexPath.section]][indexPath.row];
    cell.textLabel.text = model.catname;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
