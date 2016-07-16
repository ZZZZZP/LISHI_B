//
//  CommunityViewController.m
//  EPB_LiShi
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityTableViewCell.h"
#import "CommunityRequest.h"
#import "CommunityListModel.h"
@interface CommunityViewController ()
@property (weak, nonatomic) IBOutlet UITableView *communityTableView;

@property (nonatomic, strong) NSMutableArray *communityListArray;

@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册
    [self.communityTableView registerNib:[UINib nibWithNibName:@"CommunityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CommunityTableViewCell_Identify];
    
    self.communityListArray = [NSMutableArray array];
    
    [self requestCommunityListData];
    
}

- (void)requestCommunityListData {
    
    __weak typeof(self) weakSelf = self;
    CommunityRequest *request = [[CommunityRequest alloc] init];
    
    [request CommunityListRequestWithParameter:nil success:^(NSDictionary *dic) {
        NSDictionary *tempEvents = [dic objectForKey:@"data"];
        NSArray *tempArray = [tempEvents objectForKey:@"omnibuslist"];
        for (NSDictionary *tempDic in tempArray) {
            CommunityListModel *model = [CommunityListModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.communityListArray addObject:model];
        }
        NSLog(@"communityListArray == %@",weakSelf.communityListArray);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.communityTableView reloadData];
        });
    } failure:^(NSError *error) {
        
    }];
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 315;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.communityListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommunityTableViewCell_Identify];
    CommunityListModel *model = self.communityListArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"CommunityTableViewCell");
    
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

