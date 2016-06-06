//
//  SettingViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/7.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"
#import "SettingHeaderFooteFView.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)]];
    
    [self.tableView registerClass:[SettingCell class] forCellReuseIdentifier:@"SettingCell"];
    [self.tableView registerClass:[SettingHeaderFooteFView class] forHeaderFooterViewReuseIdentifier:@"SettingHeaderFooteFView"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourcesAry.count;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGrounp *group = [_dataSourcesAry objectAtIndex:section];
    return group.itemsCount;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingGrounp *group = [_dataSourcesAry objectAtIndex:indexPath.section];
    SettingItem *item = [group itemAtIndex:indexPath.row];
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
    [cell setItem:item];
    
    // cell分割线
    if (item.type != SettingItemTypeButton) {
        indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == group.itemsCount - 1 ? [cell setBottonLineStyle:CellLineStyleFill] : [cell setBottonLineStyle:CellLineStyleDefault];
    }else{
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottonLineStyle:CellLineStyleNone];
    }
    return cell;
}

#pragma mark - UITableViewDelegate methods
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SettingHeaderFooteFView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SettingHeaderFooteFView"];
    if (_dataSourcesAry && _dataSourcesAry.count > section) {
        SettingGrounp *group = [_dataSourcesAry objectAtIndex:section];
        [view setText:group.headerTitle];
    }
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    SettingHeaderFooteFView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SettingHeaderFooteFView"];
    if (_dataSourcesAry && _dataSourcesAry.count > section) {
        SettingGrounp *group = [_dataSourcesAry objectAtIndex:section];
        [view setText:group.footerTitle];
    }
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSourcesAry && _dataSourcesAry.count > indexPath.section) {
        SettingGrounp *group = [_dataSourcesAry objectAtIndex:indexPath.section];
        SettingItem *item = [group itemAtIndex:indexPath.row];
        return [SettingCell getHeightForText:item];
    }
    return 0.0f;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_dataSourcesAry && _dataSourcesAry.count > section) {
        SettingGrounp *group = [_dataSourcesAry objectAtIndex:section];
        if (group) {
            return section == 0? 15.0f : 10.0f;
        }
        return [SettingHeaderFooteFView getHeightForText:group.headerTitle];

    }
    return 10.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_dataSourcesAry && _dataSourcesAry.count > section) {
        SettingGrounp *group = [_dataSourcesAry objectAtIndex:section];
        if (group.footerTitle == nil) {
             return section == _dataSourcesAry.count - 1 ? 30.0f : 10.0f;
        }
        return [SettingHeaderFooteFView getHeightForText:group.footerTitle];
    }
    return 10.0f;
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
