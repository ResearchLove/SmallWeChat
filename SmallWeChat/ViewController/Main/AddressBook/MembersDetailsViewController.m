//
//  MembersDetailsViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "MembersDetailsViewController.h"
#import "MineCell.h"
#import "UIHelper.h"


@interface MembersDetailsViewController ()

@end

@implementation MembersDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"详细资料"];
    [self.tableView registerClass:[MineCell class] forCellReuseIdentifier:@"MineCell"];
    [self initTestData];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark  - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    return self.dataSourcesAry ? self.dataSourcesAry.count + 1 : 0;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    SettingGrounp *group = [self.dataSourcesAry objectAtIndex:section - 1];
    return group.itemsCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
        [cell setUserModel:_userModel];
        [cell setCellType:MineCellTypeFriends];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}
#pragma mark - UTableViewDelegate Methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        return 90.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return [super tableView:tableView heightForFooterInSection:0];
    }
    return [super tableView:tableView heightForFooterInSection:section - 1];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        
    }else{
    
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark - Private Methods
-(void)initTestData
{
    self.dataSourcesAry = [UIHelper getDetailSettingVCItems];
    [self.tableView reloadData];

}

#pragma mark - 右按钮事件
-(void)rightBarButtonDown
{
    //[self.navigationController pushViewController:self. animated:<#(BOOL)#>];

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
