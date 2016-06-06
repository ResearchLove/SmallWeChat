//
//  PersonalInfomationViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "PersonalInfomationViewController.h"
#import "UIHelper.h"

@implementation PersonalInfomationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人信息"];
    self.dataSourcesAry = [UIHelper getMineDetailVCItems];

}
#pragma mark - UITableViewDegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
