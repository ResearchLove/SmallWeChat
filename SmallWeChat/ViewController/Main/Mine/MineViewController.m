//
//  MineViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "MineViewController.h"
#import "MineCell.h"
#import "UIHelper.h"
#import "UserHelper.h"
#import "ExpressionViewController.h"
#import "SettingViewController.h"
#import "PersonalInfomationViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我"];
    
    [self.tableView registerClass:[MineCell class] forCellReuseIdentifier:@"MineCell"];
    [self initTextData];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];

}

#pragma mark - UITableViewDataSorce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourcesAry ? self.dataSourcesAry.count + 1 : 0;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0) {
        return 1;
    }
    SettingGrounp *group = [self.dataSourcesAry objectAtIndex:section -1];
    return group.itemsCount;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
        [cell setUserModel:_userModel];
        [cell setCellType:MineCellTypeMine];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];

}

#pragma mark - UITableViewDelegate Methods
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
    
    id vc = nil;
    if (indexPath.section == 0 && indexPath.row == 0) {
        vc = [[PersonalInfomationViewController alloc]init];
    }else{
        SettingGrounp *group = [self.dataSourcesAry objectAtIndex:indexPath.section - 1];
        SettingItem *item = [group itemAtIndex:indexPath.row];
        if ([item.title isEqualToString:@"表情"]) {
            vc = [[ExpressionViewController alloc]init];
        }else if ([item.title isEqualToString:@"设置"]){
            vc = [[SettingViewController alloc]init];
        }
    }
    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Private Methods
-(void)initTextData
{
    self.dataSourcesAry = [UIHelper getMineVCItems];
    _userModel = [UserHelper sharedUserHelper].userModel;
    [self.tableView reloadData];
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];


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
